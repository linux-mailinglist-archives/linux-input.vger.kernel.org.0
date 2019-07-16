Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4504C6ADD0
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 19:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfGPRnQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 13:43:16 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:43766 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfGPRnQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 13:43:16 -0400
Received: by mail-qk1-f182.google.com with SMTP id m14so15223655qka.10
        for <linux-input@vger.kernel.org>; Tue, 16 Jul 2019 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4O2wMaf14vwqMqXtUQcfthlBFTh16q+uK5wOwJM5m0k=;
        b=VXqgj3KbdynsZGqIQ7L5O3qVC+l+tDEIDGHHy3tshkOrpSal2L3eMziQKSF3juoPZZ
         oIzd0nsvWYjfWpvA4OCmRvUkegjkPdIDTimosMOivlEt7IZjiN/IhI6VJcQSu6HxfJnR
         RAva+0QOHRDmDHuIPPxyiFHv2LPlDUGvz1m+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4O2wMaf14vwqMqXtUQcfthlBFTh16q+uK5wOwJM5m0k=;
        b=gyWrjN4xjteUUjPlh7cf2ihqx4q8GVlxx5d+6N6kpMjhZAx+gXzLrx+XJypSN6dBXs
         ePsojsHeIOhQn6HBmEkkxE9xDrCnEbOut3/zLvuzNfRNR/1o3SYWMJuSFxG9tup+ie0I
         uHceCSJbOmf9JSmDtymgiDLI/PiDiIJdYOeQFCU07ym+m0LWUW8oJByzyRpQbhbSujE/
         LiRE/QwopZx4kpZu9eh5vsoojcxE3lyxhN7LPG2+RmDOa7/CjtWPXpkkfbBjD4ZJE43I
         mILP4I+c1broRzOA2dSpSEUlwsnxfFSDbWbR69qsPoIpV9h7XYAxltokU9L52xt8D15R
         v7sA==
X-Gm-Message-State: APjAAAUrvJUa9dETe8diWGnJtxTnov0Ok2cvhqic6mp+XfwxArLcPZD/
        m/QSavgJPccXy4PZPMdhIIgv4DiwAcI=
X-Google-Smtp-Source: APXvYqyJlRL+9gmomWytLuCVHdpzUX2gZIyKtO+kB26wK0GUwqW56ww/r3UsT1TUL4xQ2dNFwNwtxQ==
X-Received: by 2002:a37:9b48:: with SMTP id d69mr23670822qke.449.1563298995073;
        Tue, 16 Jul 2019 10:43:15 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id d23sm9301401qkk.46.2019.07.16.10.43.13
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 10:43:14 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id y26so20470866qto.4
        for <linux-input@vger.kernel.org>; Tue, 16 Jul 2019 10:43:13 -0700 (PDT)
X-Received: by 2002:a0c:d251:: with SMTP id o17mr25569544qvh.109.1563298993408;
 Tue, 16 Jul 2019 10:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <00ab01d53bc0$8824a440$986decc0$@emc.com.tw>
In-Reply-To: <00ab01d53bc0$8824a440$986decc0$@emc.com.tw>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Tue, 16 Jul 2019 10:43:02 -0700
X-Gmail-Original-Message-ID: <CA+jURcv8RW4tUPafgcJ=zw4G84oRmXYAnJ+S97GNka6ndwN86Q@mail.gmail.com>
Message-ID: <CA+jURcv8RW4tUPafgcJ=zw4G84oRmXYAnJ+S97GNka6ndwN86Q@mail.gmail.com>
Subject: Re: force re-enumeration i2c_hid device?
To:     =?UTF-8?B?5YqJ5ZiJ6ae/?= <scott.liu@emc.com.tw>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Cross-posting my response from the chromium-os-dev mailing list [0],
since this is probably a better list for this:

On Tue, 16 Jul 2019 at 03:23, =E5=8A=89=E5=98=89=E9=A7=BF <scott.liu@emc.co=
m.tw> wrote:
>         I already tried below:
>         1. echo =E2=80=93n =E2=80=9C0018:04F3:0732:0001=E2=80=9D >
> /sys/bus/hid/drivers/hid-multitouch/unbind
>
>         2. echo =E2=80=93n =E2=80=9C0018:04F3:0732:0001=E2=80=9D >
> /sys/bus/i2c/drivers/i2c_hid/unbind
>           bash: echo: write error: No such device

In case it helps, here's [1] our firmware updater code for rebinding
the device. I don't know off the top of my head what type of device
path it takes. However...

>         3. reboot

Rebooting should definitely rebind the device. If you're not seeing
your firmware changes after that, there's something wrong with your
firmware update process, not the rebinding.

Hope this helps.

Harry Cutts
Chrome OS Touch/Input

[0]: https://groups.google.com/a/chromium.org/forum/#!topic/chromium-os-dev=
/KVEKir0zUgo
[1]: https://chromium.googlesource.com/chromiumos/platform/touch_updater/+/=
fe4bdeb94734c092ee16dc9ff90cd269da3ee9fc/scripts/chromeos-touch-common.sh#1=
38
