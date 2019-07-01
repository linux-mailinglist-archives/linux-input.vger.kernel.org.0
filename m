Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2315E5B5D9
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 09:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfGAHns (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 03:43:48 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34219 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGAHns (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 03:43:48 -0400
Received: by mail-qt1-f195.google.com with SMTP id m29so13662870qtu.1
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2019 00:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UsTfWVpHYdpmzlOg5dLCLxoeRRCPAWRcZZ0fFOcFn8=;
        b=L7LxxR+SdQfw8cZhtu/qs2Yquqs7CRw5vcoY9qpwPOn1h/FP/m9G1TmgPodMNrWoz2
         K1wPj+FPiop8aY/T5h3d7E+jxQjz1G/eBooJVLteyzd5hK/ZQMpo5QK3xfab5yVEMav0
         KwVCkbPXzHJGzZaz/0sEYL6nvOhmq4aeu+isXMcL6oJ1B8Tufxlt1QPhr3juU0ytYTfV
         x6Hz/kk87ga3kL/VAFrilw+GJvgvvCcM95Xdf1v5Aq68RaURQsiNOqHHR4WB8wWoCezl
         YqCAGRYe3nWwvp42KYeHm0g467bbsQ2MdtbG3HosnLPbDsQya9/AlWkfFhjObbuFoKv4
         UAQQ==
X-Gm-Message-State: APjAAAUZSYyrkDYpKk30UlPXasiHdoy3H/wK0bPlsMn9Ixzpudw6/Nnm
        W9ktSovH5HHUI6jQfVOnisCP29Jfo6XyQcpojQaL0w==
X-Google-Smtp-Source: APXvYqxD1F2RLhZwknTYvElhwbk8NkzCqMUQKa6frA6OVbyR4/GWBSyr38Z1V1QQDUO+Zl1tU3oJFZywOgRo096yick=
X-Received: by 2002:a0c:d4eb:: with SMTP id y40mr20009741qvh.30.1561967027524;
 Mon, 01 Jul 2019 00:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <deaf38687dd8e9a970bc60bfd838ed62@disroot.org>
In-Reply-To: <deaf38687dd8e9a970bc60bfd838ed62@disroot.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 1 Jul 2019 09:43:35 +0200
Message-ID: <CAO-hwJ+rnGVeK7AxKitVwtnAVNn2A8ohLoGx02M50JYKE8Er8g@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics: enable SMBUS on T480 thinkpad trackpad
To:     colerogers@disroot.org
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 1, 2019 at 2:28 AM <colerogers@disroot.org> wrote:
>
> From: Cole Rogers <colerogers@disroot.org>
>
> Thinkpad t480 laptops had some touchpad features disabled, resulting in the
> loss of pinch to activities in GNOME, on wayland, and other touch gestures
> being slower. This patch adds the touchpad of the t480 to the smbus_pnp_ids
> whitelist to enable the extra features. In my testing this does not break
> suspend (on fedora, with wayland, and GNOME, using the rc-6 kernel), while
> also fixing the feature on a T480.
>
> Signed-off-by: Cole Rogers <colerogers@disroot.org>
>

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

> ---
>  drivers/input/mouse/synaptics.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index b8ec30102..c8d0f5795 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -170,6 +170,7 @@ static const char * const smbus_pnp_ids[] = {
>         "LEN005b", /* P50 */
>         "LEN005e", /* T560 */
>         "LEN0071", /* T480 */
> +       "LEN0093", /* T480 */
>         "LEN0072", /* X1 Carbon Gen 5 (2017) - Elan/ALPS trackpoint */
>         "LEN0073", /* X1 Carbon G5 (Elantech) */
>         "LEN0092", /* X1 Carbon 6 */
> --
> 2.21.0
