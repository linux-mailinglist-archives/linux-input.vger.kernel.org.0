Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2ED16B30B
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2020 22:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbgBXVps (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Feb 2020 16:45:48 -0500
Received: from mout02.posteo.de ([185.67.36.66]:60967 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbgBXVpr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Feb 2020 16:45:47 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 02B972400E6
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2020 22:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1582580746; bh=T8sWvq7Kzln+VrQ3aH+Bt5uGi3MYoL0clNreE878GX0=;
        h=To:From:Subject:Date:From;
        b=GdEGi6feyT3jAMY/mEkMYvSLJyEtrMizIwjPVUl9VeyvpLso6WE+av6AwclbyKeLa
         ZRR11goKdyeRGT+sa0BEqWDcmaPJ4tG7l+3Hki0/mgNwwRCYqK/G8VeGOl/c2jbfWH
         pIsbi2DZAIuASEEpTYVDVkhGYfp3RN7crz7RaZ4/8CyhOok/GfovIqh1Bfvm4FFvR7
         +j9RMmFlCijCT6wm1+LJYWv0xB8pyVasXsgpb0GyUb4vwYbNsWjiT5Rqn97HeYQMPe
         B/84xu703IxNd8z0K29vGkCfDbE7rCrWLVFc26W+c7kXIFF4/T/pULpdo7Z6ZRhMsb
         Cz/D+ql4I6w8w==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 48RFx53ykKz9rxV
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2020 22:45:45 +0100 (CET)
To:     linux-input@vger.kernel.org
From:   Andreas Otto <andreas.otto@posteo.de>
Subject: close on evdev file descriptor slow
Message-ID: <e4043261-ea30-6cea-5984-7e7b274cf294@posteo.de>
Date:   Mon, 24 Feb 2020 22:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

when I strace -r the following program

   #include <unistd.h>
   #include <fcntl.h>
   int main()
   {
     int fd = open("/dev/input/mice", O_RDONLY | O_NONBLOCK);
     close(fd);
     write(1, "dummy\n", 6);
   }

I get the following relevant output:

   0.000040 openat(AT_FDCWD, "/dev/input/mice", O_RDONLY|O_NONBLOCK) = 3
   0.000028 close(3)                  = 0
   0.043189 write(1, "dummy\n", 6)    = 6

Why is the close so slow?

Kernel version is 5.4.21.

I'd appreciate if I could be cc'd, since I'm not subscribed to the list.

All the best
Andreas
