Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528111727E0
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 19:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbgB0SoU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 13:44:20 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46439 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729280AbgB0SoU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 13:44:20 -0500
Received: by mail-qk1-f193.google.com with SMTP id u124so340393qkh.13
        for <linux-input@vger.kernel.org>; Thu, 27 Feb 2020 10:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qzBo3P132jiUrbgs3PbRa9YhmehrjD7gSw2/B87JkWQ=;
        b=G4apIYCJ06kCdOWAiN9AqLr5Kqk+JwVRWTpigT0qp66Yk3DnhE/aEQJtj7nZJngk/B
         ShOmBai7Yd5rRsFUucLz1kJAzy+TYyDcIYX1p8J3J+gdpEdiMvoslaugFnQpH6HczYV1
         XZa0etCvY+6PzJ77I0Y5LNDRoiuByoWM6sZHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qzBo3P132jiUrbgs3PbRa9YhmehrjD7gSw2/B87JkWQ=;
        b=q4pw5qzFzaocxM2d+KCLhHg1EeX/zJRtxG3+BPEIYq/AxTmLldNvTAAAlgmyRED9O9
         G5V01/mgy/AxKdnuW9MNis8pc4gI6Hk9e+YCGtiHbF515yYpPoXErkVtCyuE4PybsGGX
         HTKbKFJi+QDlbKoWRs5kxVCtPQX9vJVgBYcf/pDlu1etPFD17sFgQgu+b+w3lzKNMokx
         XqrpNLE+NoAb+tarCWa0xYB+76r86b/G9HjGOJ3L0RTz8FyB4BaWTWbA58eDirkSMWo4
         M756ZkY6V/vSHcZmCtaRxFW2kKnbZ77zXgk02/xsgwySFHreCduHS/CUo38G9ZFkXJ96
         Fqmw==
X-Gm-Message-State: APjAAAVSqgpBU94ZKKoeqoKBPXcFdqlwZwzpSmZezvD52MLONY8ScclK
        ZJbGqk6ePwOLQec9U/m7Xc1uy1C3dSMkMw==
X-Google-Smtp-Source: APXvYqxG/IoJ/i7qICACGjZfR/LldtJcUt8NXtbzBnQwejTkNlrJKJodkH07/DyyO3KAsmINRqWbug==
X-Received: by 2002:ae9:ec09:: with SMTP id h9mr766260qkg.65.1582829057696;
        Thu, 27 Feb 2020 10:44:17 -0800 (PST)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id i28sm3751512qtc.57.2020.02.27.10.44.16
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 10:44:16 -0800 (PST)
Received: by mail-qk1-f182.google.com with SMTP id q18so363940qki.10
        for <linux-input@vger.kernel.org>; Thu, 27 Feb 2020 10:44:16 -0800 (PST)
X-Received: by 2002:ae9:f301:: with SMTP id p1mr716972qkg.422.1582829055732;
 Thu, 27 Feb 2020 10:44:15 -0800 (PST)
MIME-Version: 1.0
References: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com>
In-Reply-To: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Thu, 27 Feb 2020 10:44:04 -0800
X-Gmail-Original-Message-ID: <CA+jURcsvxP4gVBkt_sfCOfQ3+g2G+ZznUi4Zy2ydUSpPT3XWbA@mail.gmail.com>
Message-ID: <CA+jURcsvxP4gVBkt_sfCOfQ3+g2G+ZznUi4Zy2ydUSpPT3XWbA@mail.gmail.com>
Subject: Re: [PATCH] Input: elants_i2c - Report resolution information for
 touch major
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 26 Feb 2020 at 17:13, Johnny Chuang <johnny.chuang.emc@gmail.com> wrote:
>
> From: Johnny Chuang <johnny.chuang@emc.com.tw>
>
> This patch supports reporting resolution for ABS_MT_TOUCH_MAJOR event.
> This information is needed in showing pressure/width radius.
>
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Harry Cutts <hcutts@chromium.org>

Harry Cutts
Chrome OS Touch/Input team
