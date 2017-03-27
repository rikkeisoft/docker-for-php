<?php
function testWritableDirectories(array $dirs = []): bool
{
    foreach ($dirs as $dir) {
        if(!is_writable($dir)) {
            echo $dir;
            return false;
        }
    }

    return true;
}

function testDatabaseConnection(array $db)
{
    return true;
    try {
        $connection = new \PDO($db['dsn'] ?? '', $db['user'] ?? '', $db['password'] ?? '', $db['options'] ?? []);
    } catch (\PDOException $e) {
        echo $e->getMessage();
        return false;
    }

    unset($connection);
    return true;
}

function testUploadFile()
{
    if (count($_FILES)) {
        return true;
    }

    return false;
}

$dirs = [
    __DIR__ . '/../storage',
];
$db = [
    'dsn' => 'mysql:dbname=homestead;host=db',
    'user' => 'homestead',
    'password' => 'secret',
    'options' => [],
];

if (!testDatabaseConnection($db) || !testWritableDirectories($dirs) || !testUploadFile()) {
    http_response_code(500);
} else {
    http_response_code(200);
}
