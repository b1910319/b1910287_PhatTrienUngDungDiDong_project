import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/post.dart';
import '../shared/dialog_utils.dart';
import 'post_manager.dart';

class EditPostScreen extends StatefulWidget {
  static const routeName = '/edit-post';
  EditPostScreen(
    Post? post, {
    super.key,
  }) {
    if (post == null) {
      this.post = Post(
        id: null,
        title: '',
        content: '',
        author: '',
        imageUrl: '',
      );
    } else {
      this.post = post;
    }
  }
  late final Post post;
  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Post _editedPost;
  var _isLoading = false;
  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') ||
        value.startsWith('http') && (value.endsWith('.png')) ||
        value.endsWith('.jgp') ||
        value.endsWith('.jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        setState(() {});
      }
    });
    _editedPost = widget.post;
    _imageUrlController.text = _editedPost.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    try {
      final postsManager = context.read<PostManager>();
      if (_editedPost.id != null) {
        postsManager.updatePost(_editedPost);
      } else {
        postsManager.addPost(_editedPost);
      }
    } catch (error) {
      await showErrorDialog(context, 'Something went wrong.');
    }
    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    buildTitleField(),
                    buildContentField(),
                    buildAuthorField(),
                    buildPostPreview(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildTitleField() {
    return TextFormField(
      initialValue: _editedPost.title,
      decoration: const InputDecoration(labelText: 'Title'),
      maxLines: 2,
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value!';
        }
        return null;
      },
      onSaved: (value) {
        _editedPost = _editedPost.copyWith(title: value);
      },
    );
  }

  TextFormField buildAuthorField() {
    return TextFormField(
      initialValue: _editedPost.author,
      decoration: const InputDecoration(labelText: 'Author'),
      maxLines: 2,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value!';
        }
        return null;
      },
      onSaved: (value) {
        _editedPost = _editedPost.copyWith(author: value);
      },
    );
  }

  TextFormField buildContentField() {
    return TextFormField(
      initialValue: _editedPost.content,
      decoration: const InputDecoration(labelText: 'Content'),
      maxLines: 5,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a content!';
        }
        if (value.length < 10) {
          return 'Should be at least 10 characters long.';
        }
        return null;
      },
      onSaved: (value) {
        _editedPost = _editedPost.copyWith(content: value);
      },
    );
  }

  Widget buildPostPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageUrlController.text.isEmpty
              ? const Text('Enter a URL')
              : FittedBox(
                  child: Image.network(
                    _imageUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Expanded(
          child: buildImageURLField(),
        ),
      ],
    );
  }

  TextFormField buildImageURLField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Image URL'),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an image URL!';
        }
        if (!_isValidImageUrl(value)) {
          return 'Please enter valid image URL!';
        }
        return null;
      },
      onSaved: (value) {
        _editedPost = _editedPost.copyWith(imageUrl: value);
      },
    );
  }
}
