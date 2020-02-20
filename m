Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87449165547
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2020 03:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgBTCzD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Feb 2020 21:55:03 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:33915 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbgBTCzD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Feb 2020 21:55:03 -0500
Received: by mail-lf1-f48.google.com with SMTP id l18so1842347lfc.1
        for <linux-input@vger.kernel.org>; Wed, 19 Feb 2020 18:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=F1aJm1Wl95lp1rfhO6wjzUUbKvLaanBCv44fzMtgfIc=;
        b=Mh8WPJsNxFgu3aC2tDvpB8dOwzxW+XPl3JfWxXXxl1GDa5QfMlCf1jH1uL8iI0QKUO
         TBgLJWa3tl+pLnNJGKlof/VAWRZ0ycIcUxRF0TwaSoMVTY4yNGxv73SuE8RjAnmayaps
         QDS1F4WtCptMka4rckKCykB0dJhgU1gVpc1Ql34X3SOg6d1zY29+WFKkA2oneWp6/nvZ
         6AjoFj8fc9ih8wgI/0ih6kL9hNVn+RPXPTX42+g8W+Qfn/Hr1I1vhoT4nvqJo6iMYh8Q
         DUH+CYffCsYiyPH4NcaVw3F5ilZ1VlSON9b3d26IuXsJ9ob4F1iSTpEg52CfzCrebzyw
         trlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=F1aJm1Wl95lp1rfhO6wjzUUbKvLaanBCv44fzMtgfIc=;
        b=hLG0fZU6q2t1RRsVbfk9Nl05ZbCQhdZwJSOvkIEAhVZKdC4YYgp+AVeqDxp3pwnDAj
         ubHRv2xcxufE9hfnlTiPjiTYekDvToUdjO5ML7KD6qiT9nEtbkHqVHRvqHcumm2XOUBN
         jd6RhRl3i8KwPoqAsYWAKHnEw+vdOa7dghbGRJrU4myOmGwxj660nHJIycVwUaPNXNdz
         XH7+0jHJOVY+bCjVzbDE8Z11rkcd8qvG6DOYhIM4aVUza/8qrqsV4cjW1/Mu1Ov0C56e
         R/LY3bX/hUIgfylH55bCHxhLoAiemp5aDaj75xbMAX/gzFCJccbabS7ZEh0YpmDrKQmT
         X1mQ==
X-Gm-Message-State: APjAAAUC0semBcyJx68qGBpH7EH8j1ZryuciH4lNlG148l7LLzEEF+is
        bAlvt48vTJMFp2eMis4qZC8CjC+QeqGBbXOHFkI=
X-Google-Smtp-Source: APXvYqz6kWRDmGCHYi2CF9pPI6HvL2W636U4wym3rRuy+s7v47FMLjuF/g6pRYZJnVwlRF27NwF7clHUiGdZ5U9hNy4=
X-Received: by 2002:ac2:52a3:: with SMTP id r3mr15211632lfm.189.1582167301390;
 Wed, 19 Feb 2020 18:55:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:64c6:0:0:0:0:0 with HTTP; Wed, 19 Feb 2020 18:55:00
 -0800 (PST)
From:   Andrew James <andrew.james8710@gmail.com>
Date:   Thu, 20 Feb 2020 13:55:00 +1100
Message-ID: <CALY12-HbbG+1Kv=saansTJAkqPsoXHj6LvC-9JzFxnzDE1-9Xw@mail.gmail.com>
Subject: [BUG] hid-cp2112 sda stuck low, doesn't clear
To:     dbarksdale <dbarksdale@uplogix.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi David,

I found a problem with the driver.  In this situation, the SDA line is
stuck low, but never clears, until cold rebooted.

I am using the CP2112 as a USB-to-I2C adapter with two slave devices.
Kernel version is 4.9.88.  CP2112 silicon revision is F03.

From userspace, if I ctrl+c (^c) the output of the device file of one
of the slaves, this occurs:

[  110.877415] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
[  111.909193] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
[  112.941004] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
[  113.973812] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
[  115.005627] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
[  116.037474] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
[  117.068261] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
[  118.100093] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.


The log message continues indefinitely; the clock is stuck high and
the data line is stuck low.

When we swap to a different I2C adapter in hardware, the bus lockup no
longer occurs.

Is there a modification I can make to the driver so that it can clear
the bus, or recover the CP2112?  I can forward some I2C traces if
needed.

Andrew
