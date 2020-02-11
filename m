Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B195158AD7
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 08:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgBKHvt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Feb 2020 02:51:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:47070 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgBKHvs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Feb 2020 02:51:48 -0500
Received: by mail-lj1-f194.google.com with SMTP id x14so10390760ljd.13
        for <linux-input@vger.kernel.org>; Mon, 10 Feb 2020 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fgdXEI6JDSFS3pt+rYa0nTov0L2yZsdOlWEnF1jO+qI=;
        b=ddLBv4uY/qPo4/WTa/6s7tVhISjcyuYVDvgQOt5lPYCUhn46Lxqx2yGRttA4M21jJ2
         XkwMHB2igDABKHrdvt4nVls/8e0kQFJsmxyreR1Q61+ucKy/eeV8Q9bDiWEjjSidoZ7k
         Gx39B1vhT0TaWXqsqA3kkNyLJr3KFZfyC1jg76rEv9vZlhAJ67OnTzGy+7/GjFqvdN7P
         wtxXdKK1FaKDVoOL+su8cwMhwUqVp9mUQp/6jcCE0sVkt5uRAiV5F7Z6lstP9G2avxdU
         +x9OfGyUApmKDtWgbFDbec+yjxe7/X9lDveUTBZFbGATUAlJEqoUkYnKnYyHuyY8PTVF
         vnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fgdXEI6JDSFS3pt+rYa0nTov0L2yZsdOlWEnF1jO+qI=;
        b=Ul/WZtQlrBtPqyTQjuhr2RL3e55eP7ZnzgOuafjbGbY9fedmDxNLpMDOxXlxnz+J1n
         RC1sBXRKFOEbSaNdpk29qefwro5W1mIl2mkkNJWovvXHS5oQEd4BvCuuifC+SNHl/CYA
         eGSB7wXGYxYcbYo9FJ8g8FEQR3lFJlbo/ROeeaXgodpr2DjOoYA6kaOpghQpcrIPJmNb
         TLLIL75cKrk2bwbjx+QgnBDFzXT/mV5hhddIUOA+RQ7hQ6wtpdWscb7JQ/JmRkTQzpU3
         M1Li+ku5w4jBrYBc8zwF+7y7za4LTApZz4u6b/7hE7ft4h5I3JMROYUTRkaXQXfqv2ih
         /QfA==
X-Gm-Message-State: APjAAAUR9goBK1fySMfH48Hua6u8Qz6CoOuyT5Z5AYj5epWx1egd4mEe
        k85ZJD/ghDWJ/dfovfUAJ8dOlD24/YFk2Qg99YStcozn
X-Google-Smtp-Source: APXvYqxJnQiE7JS2C880wGFnRgKbIHzgQWhPhVIMYC44J9kQAOsRaBs5fWMhUIFhqiIqmsjxjXlsnNnqXnI9FCpfo+s=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr3314342ljo.125.1581407504815;
 Mon, 10 Feb 2020 23:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20200208123359.396-1-linus.walleij@linaro.org>
 <74ab4b7b-eae2-0c6f-bb4a-eabbd3b4d042@gmail.com> <CACRpkdau3ei4OXcpucctxKqb7baHsMf8a0Q6sQ4P=gOf=bxQ5A@mail.gmail.com>
 <395b3e38-cea4-9376-1544-f1ef85abf171@gmail.com> <BYAPR10MB34797AABF2536F03BC3B4065A3190@BYAPR10MB3479.namprd10.prod.outlook.com>
 <9797aa15-eed1-932c-3cd6-64d7ccbf9d5e@gmail.com>
In-Reply-To: <9797aa15-eed1-932c-3cd6-64d7ccbf9d5e@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Feb 2020 08:51:33 +0100
Message-ID: <CACRpkdb38q0iDa+Y18bE82haoSTXzbuORjer=g9yMtsw4COuJA@mail.gmail.com>
Subject: Re: [PATCH] RFT: iio: gp2ap002: Replace LUT with math
To:     Gregor Riepl <onitake@gmail.com>
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 11, 2020 at 8:15 AM Gregor Riepl <onitake@gmail.com> wrote:

> How about this, then?
> With a full-range lookup table (47 values), it's even possible to avoid
> additional constants and simply clamp to the size of the table.

This looks VERY good!

Can you provide a patch against upstream (Jonathan's tree)
or do you want me to pick the method and send a patch (I can
add in your Signed-off-by in that case, if you approve).

Yours,
Linus Walleij
