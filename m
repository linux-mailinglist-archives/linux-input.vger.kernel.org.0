Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD1710AD4A
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 11:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfK0KKc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 05:10:32 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38835 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfK0KKb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 05:10:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id i12so26011913wro.5;
        Wed, 27 Nov 2019 02:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=8ofviy5giY5OoW8gBt1uQXk0LW0chCEHzpf9VGeaN9g=;
        b=q8YGteoIBNFZfCr7xW4t+YxlvU8hDK4ytuTXpLg1ScVtYS9ISBPQBf1EYmMaWhPLcx
         80ZkdUG2RlohIUcjLNul9av6V6UOJtkAxobpSwzqEugmTy6aaa8c6BwMBQYNGA/CH0fd
         QYNPSi47lSZMHe0M2nLo1kowtVlN3jSirAf8xBhTIZIkxt5JkhrDkcUdPOz/N3MX+vNa
         3NyUfv3TSWrpDs7oaiNyiBNwnc099KlYWug2sGG5uRiIMA+NGqucpjQjOAdhFZpSdAtu
         srHxg9QJjikvm60egCNMTPjM/gO4KT9n44tyRPhqxDp1i2FS7gYak3ugkXKCI7eL0pCc
         KYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=8ofviy5giY5OoW8gBt1uQXk0LW0chCEHzpf9VGeaN9g=;
        b=RRa4aiux2+5shm791hoZg+UXRJZYhpgBOlTJzXhfGlEy5CrxaHPLMRVWjl4wmA1TR/
         amGsaKS8RXYTLtNiUUTBqrfrC4ZVCFSbSnxLK/MZbEdB3L9iBqXuub4kldq/rLRxp7UC
         ulVLqc3/IzzLTd8OiIKzMQzTq7e+Ch6Nws/zsVddTA3IaHx8jX4v6bydlykhJMZF2ILH
         OURsmMgab0e+oGFVD1wtHHL9SpWrEpT+guq6EVvanjZSbbkAJRfMc6ruhLEsXw3pAZGr
         iO/T6/d79AVua0jO3os8+SPsA4xx8J4PM3r3u3+jXWhI6w4CPoy3UY8Yr8/EKmHWZaFp
         0+QA==
X-Gm-Message-State: APjAAAXZ1zVT0P/cGp9kDxbphPAphUs6nRzYRkOOqexyK5JKHiiUGs78
        JcXESVWHVks+AiHXiFjccCETouya
X-Google-Smtp-Source: APXvYqyAE0xKCS9ZItbNU8qJ/HwGRs6NkBvGKHdkruQabkBDMQ0zWY+uLCBT+y3JZk7DaxOwfcimYg==
X-Received: by 2002:adf:b746:: with SMTP id n6mr41447108wre.65.1574849429412;
        Wed, 27 Nov 2019 02:10:29 -0800 (PST)
Received: from nuka.localdomain (nsg93-11-83-152-80-219.fbx.proxad.net. [83.152.80.219])
        by smtp.gmail.com with ESMTPSA id l4sm5992859wml.33.2019.11.27.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 02:10:28 -0800 (PST)
Date:   Wed, 27 Nov 2019 11:10:08 +0100
From:   Mathieu Maret <mathieu.maret@gmail.com>
To:     dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mmaret@pixium-vision.com
Subject: BUG: ff_effects lost after a fork
Message-ID: <20191127101008.GA327265@nuka.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I'm using evdev for vibrator interface.
I can register ff_effect and play them.
But, if I do any kind of fork, all the effects are flush and cannot be
used.

You can find, below, an example of such a program.
From some trace have put in the kernel, it's seems that at the end of
the system() call, evdev_flush get called.

evdev_flush() will call flush_effects() that will remove all the
registered effects.

I've only one device with vibrator and it's a imx6 4.1.15 kernel. But
code looks the same that in linus master that why I'm posting it here. I
hope that it will not waste people time

For the moment, I'm using this nasty workaround:

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index e578a75..6e6002d 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -415,6 +415,8 @@ static int evdev_release(struct inode *inode, struct file *file)
 	struct evdev_client *client = file->private_data;
 	struct evdev *evdev = client->evdev;

+	evdev_flush(file, NULL);
+
 	mutex_lock(&evdev->mutex);
 	evdev_ungrab(evdev, client);
 	mutex_unlock(&evdev->mutex);
@@ -1107,7 +1109,7 @@ static const struct file_operations evdev_fops = {
 	.compat_ioctl	= evdev_ioctl_compat,
 #endif
 	.fasync		= evdev_fasync,
-	.flush		= evdev_flush,
+//	.flush		= evdev_flush,
 	.llseek		= no_llseek,
 };


* C program example


#include <errno.h>
#include <fcntl.h>
#include <linux/input.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

#define DEV_PATH "/dev/input/event1"

int main(int argc, char *argv[])
{
    int fd = open(DEV_PATH, O_RDWR);
    if (fd < 0) {
        printf("Cannot open " DEV_PATH);
    }

    // Register an effect
    struct ff_effect effects;
    memset(&effects, 0, sizeof(effects));
    effects.type                      = FF_RUMBLE;
    effects.id                        = -1;
    effects.u.rumble.strong_magnitude = 0x8000;
    effects.u.rumble.weak_magnitude   = 0;
    effects.replay.length             = 1000;
    effects.replay.delay              = 0;

    if (ioctl(fd, EVIOCSFF, &effects) < 0) {
        printf("Cannot upload effect %s\n", strerror(errno));
        return -1;
    }

    // Play this effect
    struct input_event input;
    memset(&input, 0, sizeof(input));
    input.type  = EV_FF;
    input.code  = effects.id;
    input.value = 1;
    if (write(fd, &input, sizeof(input)) != sizeof(input)) {
        printf("Cannot write %s\n", strerror(errno));
        return -1;
    }

    printf("Forking\n");
    system("sleep 1"); // Comment this line to have the second effect
    played

    // Play effect again : Nothing is played
    memset(&input, 0, sizeof(input));
    input.type  = EV_FF;
    input.code  = effects.id;
    input.value = 1;
    if (write(fd, &input, sizeof(input)) != sizeof(input)) {
        printf("Cannot write %s\n", strerror(errno));
        return -1;
    }


    close(fd);
    return 0;
}

