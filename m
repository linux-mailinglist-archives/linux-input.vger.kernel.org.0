Return-Path: <linux-input+bounces-2232-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E13BB87239A
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 17:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CD9C2875E2
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 16:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0147E129A87;
	Tue,  5 Mar 2024 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HXGyNAOT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MbD+bh52";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HXGyNAOT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MbD+bh52"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341A71292FD;
	Tue,  5 Mar 2024 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709654675; cv=none; b=KSl2PSPxRP6FMVSi7A3YO4BCVFTYnNEL/g9aRRaPP6KQkmrK6epMVCrQTmkCeoocy22H8mjA1YhGPhdG+Ny0+wogv1pOBhGGy1qihF6DtZbW9f/aKcMkv4KO2/VFl1cDcKX5iJiQ2Qo4yV6Q7Pj1fKBD1UdRJLiwV2IIJVBIqGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709654675; c=relaxed/simple;
	bh=RXaUF2VzGhd/y+m4LtLlgSkAkOUgswblMcHpyvY7nLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBye2vYBCgU/1bdee/MqFHrIpgJMuWZuUdJ7qUvmXHIAVxKWuLA6DC0Z/MdJQRx9ooiBr3Iks9Whbt4lYkEXPOSpJwMYkDkyrRCDQcDVN3TpJmDBR15kW1rhyj8s9wasP3yz2gvVUEj0rFt2Xg0K1QRxXpI9G9DigOazIdAH37k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HXGyNAOT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MbD+bh52; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HXGyNAOT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MbD+bh52; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF1A54032;
	Tue,  5 Mar 2024 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709654671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+HXNGMi2DB8YTU/LDXb7NKrP9SFnvvmbXmrJnCPG5yI=;
	b=HXGyNAOTs5HxJFAdJxYWp55PWw9tgdJDHmp9OOLJG5ECXSRgayDUWSYAvSChuPpH1k3tIC
	5DIs9eEHuIET55x+449mnwUquNx/eEHQCcUg8ohW+cPVNd3SM84ex0Hf2wufN59mGAJllU
	2FDUeXxfchoEaZGj9tX2PBU+Gg8Owag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709654671;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+HXNGMi2DB8YTU/LDXb7NKrP9SFnvvmbXmrJnCPG5yI=;
	b=MbD+bh52IVhp0Z2A1TEWHupIhfNvGS0jWKMvPU+XoEx0JxuvvX8xQ25nudNYyg2B8dkMZv
	p40oBGac76CUqlDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709654671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+HXNGMi2DB8YTU/LDXb7NKrP9SFnvvmbXmrJnCPG5yI=;
	b=HXGyNAOTs5HxJFAdJxYWp55PWw9tgdJDHmp9OOLJG5ECXSRgayDUWSYAvSChuPpH1k3tIC
	5DIs9eEHuIET55x+449mnwUquNx/eEHQCcUg8ohW+cPVNd3SM84ex0Hf2wufN59mGAJllU
	2FDUeXxfchoEaZGj9tX2PBU+Gg8Owag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709654671;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+HXNGMi2DB8YTU/LDXb7NKrP9SFnvvmbXmrJnCPG5yI=;
	b=MbD+bh52IVhp0Z2A1TEWHupIhfNvGS0jWKMvPU+XoEx0JxuvvX8xQ25nudNYyg2B8dkMZv
	p40oBGac76CUqlDw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 95F8813A5D;
	Tue,  5 Mar 2024 16:04:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id zBuJIo5C52XrXgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 16:04:30 +0000
Message-ID: <78f3218c-d44a-44d5-a5bd-5027bdeecbfc@suse.de>
Date: Tue, 5 Mar 2024 17:04:30 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] backlight: Replace struct fb_info in interfaces
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
Cc: andy@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, robin@protonic.nl, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20240304163220.19144-1-tzimmermann@suse.de>
 <20240305104459.GA86322@google.com> <20240305145325.GF86322@google.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240305145325.GF86322@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HXGyNAOT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MbD+bh52
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com,lists.freedesktop.org,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -5.50
X-Rspamd-Queue-Id: EF1A54032
X-Spam-Flag: NO



Am 05.03.24 um 15:53 schrieb Lee Jones:
> On Tue, 05 Mar 2024, Lee Jones wrote:
>
>> On Mon, 04 Mar 2024, Thomas Zimmermann wrote:
>>
>>> Backlight drivers implement struct backlight_ops.check_fb, which
>>> uses struct fb_info in its interface. Replace the callback with one
>>> that does not use fb_info.
>>>
>>> In DRM, we have several drivers that implement backlight support. By
>>> including <linux/backlight.h> these drivers depend on <linux/fb.h>.
>>> At the same time, fbdev is deprecated for new drivers and likely to
>>> be replaced on many systems.
>>>
>>> This patchset is part of a larger effort to implement the backlight
>>> code without depending on fbdev.
>>>
>>> Patch 1 makes the backlight core match backlight and framebuffer
>>> devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
>>> drivers and remove unnecessary implementations of check_fb. Finally,
>>> patch 10 replaces the check_fb hook with controls_device, which
>>> uses the framebuffer's Linux device instead of the framebuffer.
>>>
>>> v3:
>>> 	* hide CONFIG_FB_BACKLIGHT behind fb_bl_device() (Lee)
>>> 	* if-else cleanups (Andy)
>>> 	* fix commit message of patch 2 (Andy)
>>> v2:
>>> 	* fix hid-picolcd for CONFIG_FB_BACKLIGHT=n
>>> 	* fixes to commit messages
>>>
>>> Thomas Zimmermann (10):
>>>    backlight: Match backlight device against struct fb_info.bl_dev
>>>    auxdisplay/ht16k33: Remove struct backlight_ops.check_fb
>>>    hid/hid-picolcd: Fix initialization order
>>>    hid/hid-picolcd: Remove struct backlight_ops.check_fb
>>>    backlight/aat2870-backlight: Remove struct backlight.check_fb
>>>    backlight/pwm-backlight: Remove struct backlight_ops.check_fb
>>>    fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
>>>    fbdev/ssd1307fb: Init backlight before registering framebuffer
>>>    fbdev/ssd1307fb: Remove struct backlight_ops.check_fb
>>>    backlight: Add controls_device callback to struct backlight_ops
>>>
>>>   drivers/auxdisplay/ht16k33.c             |  8 ------
>>>   drivers/hid/hid-picolcd_backlight.c      |  7 ------
>>>   drivers/hid/hid-picolcd_core.c           | 14 +++++------
>>>   drivers/hid/hid-picolcd_fb.c             |  6 +++++
>>>   drivers/video/backlight/aat2870_bl.c     |  7 ------
>>>   drivers/video/backlight/backlight.c      |  8 ++++--
>>>   drivers/video/backlight/bd6107.c         | 12 ++++-----
>>>   drivers/video/backlight/gpio_backlight.c | 12 ++++-----
>>>   drivers/video/backlight/lv5207lp.c       | 12 ++++-----
>>>   drivers/video/backlight/pwm_bl.c         | 12 ---------
>>>   drivers/video/fbdev/core/fb_backlight.c  |  5 ++++
>>>   drivers/video/fbdev/sh_mobile_lcdcfb.c   |  7 ------
>>>   drivers/video/fbdev/ssd1307fb.c          | 31 +++++++++---------------
>>>   include/linux/backlight.h                | 16 ++++++------
>>>   include/linux/fb.h                       |  9 +++++++
>>>   include/linux/pwm_backlight.h            |  1 -
>>>   16 files changed, 70 insertions(+), 97 deletions(-)
>> All applied.  Submitted for build testing.
>>
>> Will follow-up with a PR once that's passed.
> In file included from /builds/linux/include/linux/backlight.h:13,
>                   from /builds/linux/drivers/video/backlight/lp855x_bl.c:12:
> /builds/linux/include/linux/fb.h:736:26: warning: no previous prototype for 'fb_bl_device' [-Wmissing-prototypes]
>   struct backlight_device *fb_bl_device(struct fb_info *info)

Thanks. I'll investigate and send an update. Sorry for that issue.

Best regards
Thomas

>
> ##########################
>
>   Errors were caused
>   
> [v6.8-rc1] ib-backlight-auxdisplay-hid-fb-6.8 7e508af663e20 ("backlight: Add controls_device callback to struct backlight_ops")
>
>   arc allnoconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOFnv6gFmUDNhk9qfBePj2N0/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQhlmdHMnzDWy8bgy8Yhwp4b/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arc allnoconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKKrZxZBeoUCAsVcKq7Im3B/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtDIJZ7rQPDViKMcsNEOgvR/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arc axs101_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOLZg1SwVMW2RAjIULk4qh65/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpsxuvbbnXzVO6TfUCzEbtW/ 	Fail (3 errors - 31 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arc hsdk_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOFgReAHQOVHiFozZbdQWn7l/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQjUYkWfJ5thTdSZElfjJnQ2/ 	Fail (2 errors - 22 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arc tinyconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOD0gTB8Eoj9sqLm7eItgcw2/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQjcwsTzF1TscpNtSmcOHfN8/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arc tinyconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOLHB7Cd0OF48LwEHORZYUwC/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpQOjAX4HLQfDttdu7SGmCo/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 allmodconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJvNqgXUenz1S3BY8KEW8S8/ 	Fail (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpLqwVSS5U9KFsvs4aihPWN/ 	Fail (9450 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 allmodconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOXeoVHzFSP6J4xI6S6f1jZB/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpu5ujPvzKUvV3N2YvVlG37/ 	Fail (9450 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 allnoconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOMLAnQrN28HpvM436yUGptz/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtT41KhGSq7E9oCIbXpmr0L/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 allnoconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOUECCIEuIC9qjtR2usPZVgr/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQyxt3hdpHhuhYMdJyAvz8T0/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKTLSaqJNwPfX7rrqtMbjWQ/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQvoRqEQxDA9OPui9oEZY2Eh/ 	Fail (3 errors - 63 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOSVqbxoqJ5ZlloM16u1j9uH/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR0ksfisbtdlWn5zidhfKgfG/ 	Fail (3 errors - 63 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 tinyconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOL2h9r84ReHNsQbFWdYb9zA/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtg2U3DMmhrx5XZjhMzLvaK/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm64 tinyconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOX0H8ClYysl2wGU5FXeqStj/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQyP560IGFjrOVkI1wzH3Mdm/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm allnoconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOL0yb08iiVb3drd15ZjY9n9/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQi1aUmJ9H8cQEhcTpGF5B2O/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm allnoconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJn5VKF99ZsIeyzXcYFO7C4/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrGOAirtIXiCS166B7sq73F/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm bcm2835_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKFaEb1Lan8L82nDqdOCBaE/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQkhxNsajVdPofEcQrhbEqh1/ 	Fail (181 errors - 31 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm bcm2835_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOVvc8VYa7ynzXPRaDBhw7L7/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQqthXPr0GiiZCpN2awTiCvm/ 	Fail (181 errors - 31 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm exynos_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJxJLpW84g2Y2ygYhjTCS7D/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQlfcaTd744gHsEQZQ7kju8U/ 	Fail (125 errors - 38 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm exynos_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOSAzoCZZvh08E7IdX902i8m/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQuDstveo2iHo2LcLJwNSdZI/ 	Fail (125 errors - 38 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm hisi_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXONgXlcrobSvs8vkdY9VbqsX/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQs3F7nkztLdqLQTO3TvN0Fp/ 	Fail (0 errors - 5 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm hisi_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOXFSwRBq2bGw0OalI9CP8sH/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQsvaNlkPx3Pz4mTNb3aHyJt/ 	Fail (0 errors - 5 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm qcom_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKSmcS9QdzxGDbmsWMMXDVV/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQqFN1R07pYGNMP0ZNgTKL4h/ 	Fail (3 errors - 34 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm qcom_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOWVygTuMUJ0QqsqxbVro5tS/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrgWUUTbt9WBGVEYYySdKKT/ 	Fail (3 errors - 34 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm rpc_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOP5kio8OZ4hBaLiqKTH638B/ 	Pass (0 errors - 8 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQqBxPgWkDVQOvoZbVXVEJUk/ 	Fail (46 errors - 30 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm tinyconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOOrIT03LWNJBYy4I7SZZLwo/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQl5K1AcAa4uLbJ4mSP46vji/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm tinyconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOP8UPgUANWxizuVLJ5RFrOh/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrScpCj7WUtQ7hEoerry89n/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm u8500_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOOTc4fY8ZVksLpu4B0Cept6/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQucBv9mphTfIec2iCoO7FAA/ 	Fail (17 errors - 39 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   arm u8500_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOVlcdE6uJPJpjrW4D0i2Zea/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQuddQgdScLgr7z1yjLtU9kE/ 	Fail (17 errors - 39 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   i386 i386_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOQXYkIEKnb3F9LjpG1Sy9iW/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQuJhoRWFU4ScPBfrw1cXua3/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   i386 i386_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOX6NMFqS3YRL2NvLkZoA1HB/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR29cg5J4k4ks6lDKIq6rFos/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips allnoconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKPoYSFZYdBRYlkK3t7dqB6/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQripL0vUGBKFPyFk3uKScQF/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips allnoconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOTLX4kx8Zrggtb3HIhoEQUo/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR2Sq0jeTq61n7ZNAmNjkvA2/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips cu1000-neo_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXORDLo8D5VpJTcjyzCDiq4uI/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR2oyxBTN2eie0N1bZ8nbRn3/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips qi_lb60_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOMInwFyDNM7Dz60GHmKD92A/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpuRsIk3nCg2M4UygGXYznA/ 	Fail (2 errors - 7 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips qi_lb60_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOWgX0mWwhL4C4odKOlhykGO/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQzOCWgsfADTGWZDAmjSwwI7/ 	Fail (2 errors - 7 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips tinyconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJxQ6uBNx3rqvHJUB9jYmfI/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQw5sOQ3Pk2B3ClS9jZvaBmY/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips tinyconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOTjzBn19txhKK68byvdMnI3/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR3a7PmtE6m7zobe9vSArMjp/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   mips xilfpga_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOQp85uaxAauoKtAIWshN254/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtRlZoiImIidUOtNfW9EM2F/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   powerpc allmodconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKZUZ4luBNDCJNLUgqOnVe8/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQsnc4xsG2u2ixGczVQDpyCU/ 	Fail (9005 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   powerpc allmodconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOYdyNpKcalGcP2YntdEk1IA/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR0Ua9sytZxT839zEgXRNCMj/ 	Fail (9005 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   powerpc allnoconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXONTngxZkx4CkQWFCiOfwg70/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrbRjTyt95ltP3t1MxzrYh1/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   powerpc allnoconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOTEfkQyCRHEOzbbOH0afLAh/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQz0clzBdEy0qhFTh2IEu00a/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   powerpc tinyconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOPIu7RaL9aDGJ8pkSZv4bMR/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQsyReY2GIrGfYLSxlOWZ74f/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   powerpc tinyconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOU2QIY0zQXtGZ5mIV3UQ5x1/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR2f4C7iZbU6gca36QRf8xzz/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   x86_64 allmodconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOOdlotTccsa3jUsMw0mEMqK/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQptW04gBeDYysPHUVtKxrzA/ 	Fail (9781 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   x86_64 allmodconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOV5o3OJ8cjSaaRKbPMwxRDb/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQzKo3q53SPT2S4dgai8cAlU/ 	Fail (9781 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   x86_64 x86_64_defconfig gcc-8
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOO41yqQgH7KziVn2oV8KNWq/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQutvDXWLAAjvOY80xsf1wgQ/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>
>   x86_64 x86_64_defconfig gcc-9
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOUPQnMxIxbqO1K7t3oCexeC/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>       https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQxFJaNzNzrfUj974h9F1nmG/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


