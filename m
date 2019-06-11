Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E803C623
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 10:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391465AbfFKIn1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 04:43:27 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33156 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391401AbfFKIn1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 04:43:27 -0400
Received: by mail-qk1-f196.google.com with SMTP id r6so7135533qkc.0
        for <linux-input@vger.kernel.org>; Tue, 11 Jun 2019 01:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fAM2ZnplmXr9IFFiNeSowp8y01t03eeswE+odNZ6E9s=;
        b=Idq+zkATvQMYBaFjLdtmHijwimS54bd33QEjM9iXt/0TGiT6lFGM+YA5h8j/PnhqmO
         hgPbdv0oORgzT4rdiQrPIBilFiWCUaged+cvazcNRRjkQTSf2vpAFREQdybFjqig2Ajh
         7g+rRIl1763kc9sYAnX2WheoZwapzSm9EmTjrdxeqLKVMkm3duc0hjtHggmNv6vZgZdx
         8umfA07wHpw5eikhHFpRuwtxfANGeY/ARmhW+Q9D5pJVyDw/vo5noWvmvLXodqFal+OI
         Y7ZEGVDMPt6bccp8AP0/YKbl5chgBdzA7mBdM2WUWKZN7SSCFmTxQyBJzm+PyuFA/d+W
         D3/w==
X-Gm-Message-State: APjAAAXm1+4SUH7Wd1b+SYXvNay3zamBHNJzsJYl+2DWZQ9fKPBZye2b
        DEIrBonapKZ1Lb/0ivwZwgOajCkE0SaevgD+3mC3hw==
X-Google-Smtp-Source: APXvYqw1q0laWbp9i/uhwxQEKfuIRYv0WpOBz7X6AGZWrVWGLfI5PYVS4p5HqaMfLACNsj0LWVIWA+5OhadJGL7OKMk=
X-Received: by 2002:a37:ea16:: with SMTP id t22mr59894613qkj.337.1560242606439;
 Tue, 11 Jun 2019 01:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190610185343.27614-1-nsaenzjulienne@suse.de>
In-Reply-To: <20190610185343.27614-1-nsaenzjulienne@suse.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 11 Jun 2019 10:43:15 +0200
Message-ID: <CAO-hwJJzYFQs_Jxc+3zYHzjM9G8zdTfBqdpO27hpKXRBKytvQA@mail.gmail.com>
Subject: Re: [PATCH] HID: input: fix a4tech horizontal wheel custom usage id
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nicolas,

On Mon, Jun 10, 2019 at 8:54 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Some a4tech mice use the 'GenericDesktop.00b8' usage id to inform
> whether the previous wheel report was horizontal or vertical. Before
> c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key") this
> usage id was being mapped to 'Relative.Misc'. After the patch it's
> simply ignored (usage->type == 0 & usage->code == 0). Checking the HID
> Usage Tables it turns out it's a reserved usage_id, so it makes sense to
> map it the way it was. Ultimately this makes hid-a4tech ignore the
> WHEEL/HWHEEL selection event, as it has no usage->type.
>
> The patch reverts the handling of the usage id back to it's previous
> behavior.

Hmm, if A4Tech is using a reserved usage, we shouldn't fix this in
hid-input.c but in hid-a4tech instead.
Because you won't know when someone else in the HID consortium will
remap this usage to some other random axis, and your mouse will be
broken again.

How about you add a .input_mapping callback in hid-a4tech and map this
usage there to your needs? This way you will be sure that such a
situation will not happen again.

Cheers,
Benjamin

>
> Fixes: c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  drivers/hid/hid-input.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 63855f275a38..6a956d5a195e 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -671,7 +671,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 if ((usage->hid & 0xf0) == 0xb0) {      /* SC - Display */
>                         switch (usage->hid & 0xf) {
>                         case 0x05: map_key_clear(KEY_SWITCHVIDEOMODE); break;
> -                       default: goto ignore;
> +                       default: goto unknown;
>                         }
>                         break;
>                 }
> --
> 2.21.0
>
