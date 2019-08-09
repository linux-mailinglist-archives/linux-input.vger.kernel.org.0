Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722C4873D0
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 10:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405807AbfHIILN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 04:11:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42952 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405612AbfHIILN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 04:11:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so91291393lje.9
        for <linux-input@vger.kernel.org>; Fri, 09 Aug 2019 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rmeq1c6gxhoiYjHzkg5m8+3lwOgjC2DYDSYJ7FkGuyg=;
        b=gUxqBIhChMJXpMj6/HiKHkUgnSITXSgwxApcXYqRBlYDwsjzXVD5lMJrwjSDymhBnE
         WsVSdwfL2Xh7uuyW6IytKaYhWBYzwY0BrWg/1Otd502H8NwNgBS1GnVtYCHgf+XblN+L
         1abwCUHyZ2K1cT0Sgr8/RCya/1Er4jZCbt2vzOaVHVXrPHa/8rxYcgFEC6sk4h4xJjSe
         3uF2aoa0xbc2BGR5ATB8P8gjoKnvGtN+bGl1FU7AZ0gxrw2j53yn3xb/orJXCVVeKzh9
         W6Y1hdioKD1iC6hJhCXSc7Yq4wH/B2wNYqd1lpKnt5dr6uRG5N3Pu+Vt0QOzxXr35gQu
         EGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rmeq1c6gxhoiYjHzkg5m8+3lwOgjC2DYDSYJ7FkGuyg=;
        b=sA6BlIJMsHyLPRVJvbagTd4MpCh9GL/zXHq8aeiwEZmygvX6SFiouqzfukNTW1uMCc
         KJFgWieSfhjDf9y8eoh0iD1xJAasnXLf0LAXkPz9bsPtgdsBxKSu3v4B1i10LQ/oQZ2/
         PJwAF1M8IVrcLmCwgSELmj0mWya+I500TNgcp0tQGL+A9S6Q5Tu+vAY0jmQKQn9moSl4
         nG3f73wqDrQuGsQXQ6yjv8UoCxh+qRVdJ3uSiTXUUZYr8ZVoAKMNPZHFZR/0bJqax/uf
         sotnCVgv4Eq1FQ2s0fcfbNfKCzykYmanSFMbqWqIDp1fi0Vs2u0ggZrN8V+HVAlaTWJ5
         JSNg==
X-Gm-Message-State: APjAAAWWS+YyyPR0Q6dGjgAvOVLfjJzNp7OogUMukY/gSo95yxVpwfIF
        peOK1l7csDyc3MfNEf1bdlagLXseVotvk/vsrCYkqQ==
X-Google-Smtp-Source: APXvYqxOQoxWmow1WxUrPRnmmJuNVAb21VGuASyxMODUuaj92XTEblj+Ff+7T8kjBaKh4utPceOP/7WGS3OnCAzt5uI=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr10736406ljj.108.1565338271186;
 Fri, 09 Aug 2019 01:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190808144458.1258-1-linus.walleij@linaro.org> <20190808190334.GE178933@dtor-ws>
In-Reply-To: <20190808190334.GE178933@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Aug 2019 10:10:59 +0200
Message-ID: <CACRpkdbp20f2D8ezPiLdSjpxYvq0OkM9rnGJocT8trj2Jyb0aQ@mail.gmail.com>
Subject: Re: [PATCH] Input: bu21013_ts: Convert to use GPIO descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 8, 2019 at 9:03 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Do you have a device to test this on?

Actually, yes! I will try to kick it into action and mention in the commit
that it is tested on that device.

> I am not very fond of mixing up
> devm and non-devm resources, so if we are cleaning it up I'd like to do
> more cleanups...

That's fine. I will send some cleanups and move more stuff to
devm_* when I have the device up and running.

Yours,
Linus Walleij
