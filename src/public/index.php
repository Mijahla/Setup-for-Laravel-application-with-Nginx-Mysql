<?php
// Ultra Simple Blog
// Sample posts
$posts = [
    ['id' => 1, 'title' => 'Docker is awesome', 'content' => 'Containers make deployment easy.'],
    ['id' => 2, 'title' => 'Laravel rocks', 'content' => 'PHP framework for web artisans.'],
    ['id' => 3, 'title' => 'MySQL database', 'content' => 'Stores all our application data.']
];

// Test DB connection
try {
    new PDO('mysql:host=mysql;dbname=laravel_db', 'laravel_user', 'secret');
    $db_status = ' Connected';
} catch (Exception $e) {
    $db_status = ' Connecting...';
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Blog</title>
    <style>
        body { font-family: monospace; max-width: 600px; margin: 40px auto; }
        h1 { border-bottom: 1px solid #ccc; }
        .post { border: 1px solid #ddd; margin: 20px 0; padding: 15px; }
        .status { background: #f0f0f0; padding: 10px; margin: 10px 0; }
        form input, form textarea { width: 100%; margin: 5px 0; }
    </style>
</head>
<body>
    <h1>Simple Blog</h1>
    
    <div class="status">
        Database: <?php echo $db_status; ?><br>
        PHP: <?php echo phpversion(); ?>
    </div>
    
    <h2>Posts</h2>
    <?php foreach($posts as $post): ?>
    <div class="post">
        <h3><?php echo $post['title']; ?></h3>
        <p><?php echo $post['content']; ?></p>
   
    </div>
    <?php endforeach; ?>
    
    <h2>Add Post (Demo)</h2>
    <form method="POST">
        <input type="text" name="title" placeholder="Title"><br>
        <textarea name="content" placeholder="Content" rows="3"></textarea><br>
        <button type="submit">Submit</button>
    </form>
    
    <footer style="margin-top: 40px; color: #666;">
        Simple Blog
    </footer>
    
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        echo '<script>alert("Demo: Post submitted\\nTitle: ' . ($_POST['title'] ?? '') . '");</script>';
    }
    ?>
</body>
</html>
