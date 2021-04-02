{\rtf1\ansi\ansicpg1252\cocoartf2578
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- phpMyAdmin SQL Dump\
-- version 4.9.5\
-- https://www.phpmyadmin.net/\
--\
-- Host: localhost:8889\
-- Generation Time: Apr 02, 2021 at 03:07 AM\
-- Server version: 5.7.30\
-- PHP Version: 7.4.9\
\
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";\
SET time_zone = "+00:00";\
\
--\
-- Database: `movie_app`\
--\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `login`\
--\
\
CREATE TABLE `login` (\
  `id` int(11) NOT NULL,\
  `email` varchar(100) NOT NULL,\
  `password` varchar(100) NOT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
--\
-- Dumping data for table `login`\
--\
\
INSERT INTO `login` (`id`, `email`, `password`) VALUES\
(1, 'votana@gmail.com', 'votana123'),\
(3, 'votanasrey@gmail.com', '1234v'),\
(8, 'votana@gmal.com', '12345678'),\
(9, 'votana@gmail.com', '123'),\
(10, 'kiki@gmail.com', '1234');\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `member`\
--\
\
CREATE TABLE `member` (\
  `id` int(50) NOT NULL,\
  `name` varchar(100) NOT NULL,\
  `body` varchar(1000) NOT NULL,\
  `img` varchar(15000) NOT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
--\
-- Dumping data for table `member`\
--\
\
INSERT INTO `member` (`id`, `name`, `body`, `img`) VALUES\
(1, 'VotanaSrey', 'Hi From Votana', 'https://media.istockphoto.com/photos/closeup-of-lion-panthera-leo-8-years-old-in-front-of-white-background-picture-id944272094?k=6&m=944272094&s=612x612&w=0&h=J4pjHVFfW10BaZ4bZ06sirxbNdcw4rBu4DDkVHflMSk='),\
(2, 'KhemrathSeng', 'Hi From Khemrath', 'https://media.istockphoto.com/photos/closeup-of-lion-panthera-leo-8-years-old-in-front-of-white-background-picture-id944272094?k=6&m=944272094&s=612x612&w=0&h=J4pjHVFfW10BaZ4bZ06sirxbNdcw4rBu4DDkVHflMSk='),\
(3, 'KemengSong', 'Hi From Kemeng', 'https://media.istockphoto.com/photos/closeup-of-lion-panthera-leo-8-years-old-in-front-of-white-background-picture-id944272094?k=6&m=944272094&s=612x612&w=0&h=J4pjHVFfW10BaZ4bZ06sirxbNdcw4rBu4DDkVHflMSk='),\
(7, 'gay Lay', 'Hi From gay lay', 'https://media.istockphoto.com/photos/closeup-of-lion-panthera-leo-8-years-old-in-front-of-white-background-picture-id944272094?k=6&m=944272094&s=612x612&w=0&h=J4pjHVFfW10BaZ4bZ06sirxbNdcw4rBu4DDkVHflMSk='),\
(8, 'Elon Musk', 'Hi Form Tesla', 'https://media.istockphoto.com/photos/closeup-of-lion-panthera-leo-8-years-old-in-front-of-white-background-picture-id944272094?k=6&m=944272094&s=612x612&w=0&h=J4pjHVFfW10BaZ4bZ06sirxbNdcw4rBu4DDkVHflMSk='),\
(11, 'JackMa', 'Hi From Jack', 'https://media.istockphoto.com/photos/closeup-of-lion-panthera-leo-8-years-old-in-front-of-white-background-picture-id944272094?k=6&m=944272094&s=612x612&w=0&h=J4pjHVFfW10BaZ4bZ06sirxbNdcw4rBu4DDkVHflMSk=');\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `setting`\
--\
\
CREATE TABLE `setting` (\
  `id` int(10) NOT NULL,\
  `name` varchar(100) NOT NULL,\
  `phone` varchar(50) NOT NULL,\
  `level` varchar(100) NOT NULL,\
  `img` varchar(1000) NOT NULL,\
  `email_address` varchar(500) NOT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
--\
-- Dumping data for table `setting`\
--\
\
INSERT INTO `setting` (`id`, `name`, `phone`, `level`, `img`, `email_address`) VALUES\
(1, 'VotanaSrey', '0 86678825', 'Pro', 'https://media.istockphoto.com/photos/closeup-of-lion-panthera-leo-8-years-old-in-front-of-white-background-picture-id944272094?k=6&m=944272094&s=612x612&w=0&h=J4pjHVFfW10BaZ4bZ06sirxbNdcw4rBu4DDkVHflMSk=', 'votana.srey@gmail.com');\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `signup`\
--\
\
CREATE TABLE `signup` (\
  `id` int(11) NOT NULL,\
  `name` varchar(100) NOT NULL,\
  `email` varchar(100) NOT NULL,\
  `password` varchar(50) NOT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
--\
-- Dumping data for table `signup`\
--\
\
INSERT INTO `signup` (`id`, `name`, `email`, `password`) VALUES\
(9, 'Ki Ki', 'kiki@gmail.com', ''),\
(10, 'pichpich', 'pichpich@gmail.com', ''),\
(16, 'Srey Votana', 'votana@gmail.com', ''),\
(17, 'Kiki', 'kiki@gmail.com', '');\
\
--\
-- Indexes for dumped tables\
--\
\
--\
-- Indexes for table `login`\
--\
ALTER TABLE `login`\
  ADD PRIMARY KEY (`id`);\
\
--\
-- Indexes for table `member`\
--\
ALTER TABLE `member`\
  ADD PRIMARY KEY (`id`);\
\
--\
-- Indexes for table `setting`\
--\
ALTER TABLE `setting`\
  ADD PRIMARY KEY (`id`);\
\
--\
-- Indexes for table `signup`\
--\
ALTER TABLE `signup`\
  ADD PRIMARY KEY (`id`);\
\
--\
-- AUTO_INCREMENT for dumped tables\
--\
\
--\
-- AUTO_INCREMENT for table `login`\
--\
ALTER TABLE `login`\
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;\
\
--\
-- AUTO_INCREMENT for table `member`\
--\
ALTER TABLE `member`\
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;\
\
--\
-- AUTO_INCREMENT for table `setting`\
--\
ALTER TABLE `setting`\
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;\
\
--\
-- AUTO_INCREMENT for table `signup`\
--\
ALTER TABLE `signup`\
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;\
}