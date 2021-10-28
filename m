Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2BF43E6F9
	for <lists+linux-input@lfdr.de>; Thu, 28 Oct 2021 19:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhJ1RSO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 13:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhJ1RSN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 13:18:13 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1CAC061570
        for <linux-input@vger.kernel.org>; Thu, 28 Oct 2021 10:15:43 -0700 (PDT)
Date:   Thu, 28 Oct 2021 19:15:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635441341;
        bh=8tuhDeAUvb/v97uaCLKxuJ/QDMC+772HMxlVw9+LVyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s7/mD1JiuDn65vsn6Oq7f25ZZoKPLczxNdQ29DiB+lMrFSDC+KJoinQt1W6sortD4
         O3J4XNptoZO7JEo6JO3PsK9u8WCFitM16zMIGHl0EUnBlXoNzO35BkSeGkd3TITBEr
         7+xa4kFff9fipaAVSIy6l6bM+e5gUKMhssmwQGf4=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Benjamin Tissoires <btissoir@redhat.com>
Subject: Re: [PATCH] HID: input: Fix parsing of HID_CP_CONSUMER_CONTROL fields
Message-ID: <f8613865-d4ea-48c3-ad39-ff0bb26a3655@t-8ch.de>
References: <20211028163330.503146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211028163330.503146-1-hdegoede@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2021-10-28 18:33+0200, Hans de Goede wrote:
> Fix parsing of HID_CP_CONSUMER_CONTROL fields which are not in
> the HID_CP_PROGRAMMABLEBUTTONS collection.
> 
> Fixes: bcfa8d14570d ("HID: input: Add support for Programmable Buttons")
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2018096
> Cc: Thomas Weißschuh <linux@weissschuh.net>
> Suggested-by: Benjamin Tissoires <btissoir@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-input.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 4b5ebeacd283..4b3f4a5e2305 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -650,10 +650,9 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>  						code += KEY_MACRO1;
>  					else
>  						code += BTN_TRIGGER_HAPPY - 0x1e;
> -				} else {
> -					goto ignore;
> +					break;
>  				}
> -				break;
> +				fallthrough;
>  		default:
>  			switch (field->physical) {
>  			case HID_GD_MOUSE:
> -- 
> 2.31.1

Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>

Although looking at the descriptor I'm not sure that what it does is correct.

FYI I have another patch in the pipeline that fixes broken keymap remapping for
ignored keys.
Such a remapping via the hwdb would have been another, maybe more correct, way
to fix this issue.
