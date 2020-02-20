Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B111655B5
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2020 04:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgBTDcj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Feb 2020 22:32:39 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:46837 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgBTDcj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Feb 2020 22:32:39 -0500
Received: by mail-lf1-f46.google.com with SMTP id z26so1829095lfg.13
        for <linux-input@vger.kernel.org>; Wed, 19 Feb 2020 19:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=1hZMWi/+0W+ECg+qBExFFuhEYDCJpmtqHfYHMBUsYKA=;
        b=YPv/5VPcybeoprZdMckMbhAO3HENv/ZyR7W3WFMtBk0Fe0Q6/K5znzSGeSIudDwQJO
         SqvKkxRN7iN+3lmzQTgv+crNf/H2LcRft9FOlZpeUZd+tfdsflAmNhUmHhuMhT919Xd9
         veyJ+j/B/717oLDpwRbu3cOYLGQwk60Tv0UnWKgzB/MIVyTQZ535/nbjVlm429f/APqn
         oKAyPgA9qB7nL2M/JltFZviY66LFqaKIDvqY1Y3uNJEY9DKibTxdWqOjwagw5HtToaxZ
         /HCKrP3WpRn2WQ6MzqXME6omUa4ophhIa7kqRX/o20HcNsrTjw/tuYzumhyOV44sJgJD
         a5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to;
        bh=1hZMWi/+0W+ECg+qBExFFuhEYDCJpmtqHfYHMBUsYKA=;
        b=kDrWIa52LfQkG5rlJIfVwMF87T1xRE1p49fZFw3BJgQvJ7VMTJgINK5qt1MxbeJObz
         /V2189ft7LoGvrKKaW75tz0EVbTmqKxSmSwL4gf5rR3LzrvVXExJc7foX9XhJDoV6BC7
         c1UV5+mYOTzczhRyNUj9Rbecwube+IkRLFQNgYOuVx3kRrbPoP0NOMGUiBLHkDgUONWo
         DKkXE9ThTPV2YqlXXez7f6K9cFjRTFe3Q5uhlZ/jdSx0ByZiVud8h92wCIyE/CkUcUse
         YcqeH5/iehsL4yTngPh/ANjCDmWXSjwzfbOTaBNa6X/YJ0ES+OgY3LlJfq3k+BJ9ENaX
         NpNw==
X-Gm-Message-State: APjAAAUbPGPT+cUc0QKsGJxtPxDJR1/Zg+ADN093rRurL+ggtqQhVZKq
        f31S3NU9KBUTfLrI1nWLT7r/S9f/Khp6tDzUhNa8L2FVBPg=
X-Google-Smtp-Source: APXvYqx12VTO7sZh013FjMeZgtm6LWC360fe6nSH7ibh1VRd+0yDnFxjj51s2m6TNHSoEkvmdYMOEcXsfZcif4FFJ+Y=
X-Received: by 2002:ac2:555c:: with SMTP id l28mr15307351lfk.52.1582169555599;
 Wed, 19 Feb 2020 19:32:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:64c6:0:0:0:0:0 with HTTP; Wed, 19 Feb 2020 19:32:34
 -0800 (PST)
In-Reply-To: <CALY12-HbbG+1Kv=saansTJAkqPsoXHj6LvC-9JzFxnzDE1-9Xw@mail.gmail.com>
References: <CALY12-HbbG+1Kv=saansTJAkqPsoXHj6LvC-9JzFxnzDE1-9Xw@mail.gmail.com>
From:   Andrew James <andrew.james8710@gmail.com>
Date:   Thu, 20 Feb 2020 14:32:34 +1100
Message-ID: <CALY12-FS+-EXseWcJdvaS5bmafkz1X1qkhafTE6YDKA3nWk1fw@mail.gmail.com>
Subject: Re: [BUG] hid-cp2112 sda stuck low, doesn't clear
To:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

For some reason David's email address bounces:
dbarksdale <dbarksdale@uplogix.com>

He was the original author of this chip driver.
If anyone can help me to grab his attention that would be awesome.

Thanks!
Andrew

On 2/20/20, Andrew James <andrew.james8710@gmail.com> wrote:
> Hi David,
>
> I found a problem with the driver.  In this situation, the SDA line is
> stuck low, but never clears, until cold rebooted.
>
> I am using the CP2112 as a USB-to-I2C adapter with two slave devices.
> Kernel version is 4.9.88.  CP2112 silicon revision is F03.
>
> From userspace, if I ctrl+c (^c) the output of the device file of one
> of the slaves, this occurs:
>
> [  110.877415] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
> [  111.909193] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
> [  112.941004] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
> [  113.973812] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
> [  115.005627] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
> [  116.037474] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
> [  117.068261] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
> [  118.100093] cp2112 0003:10C4:EA90.0001: Transfer timed out, cancelling.
>
>
> The log message continues indefinitely; the clock is stuck high and
> the data line is stuck low.
>
> When we swap to a different I2C adapter in hardware, the bus lockup no
> longer occurs.
>
> Is there a modification I can make to the driver so that it can clear
> the bus, or recover the CP2112?  I can forward some I2C traces if
> needed.
>
> Andrew
>
