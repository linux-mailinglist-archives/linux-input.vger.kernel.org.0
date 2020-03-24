Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10AB5191976
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 19:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgCXSvZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 14:51:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42605 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgCXSvZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 14:51:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id h8so9476957pgs.9
        for <linux-input@vger.kernel.org>; Tue, 24 Mar 2020 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9btm4eeFMrtQH0GA96/+zzP0kg6lFhTNnEdJkODNmGc=;
        b=piaD8Hvkx7c3k1XB5oWPxUjY7rmVZQJ2b4Du0qW47jKl8OtTg8o1eixDbxFUBynG/v
         Gg9xnPROrpXmFOfwtP9AGhkg2c4FInYMBJnkpps3yjNKmoMs9RpUofK2BqW6fLVf4pXX
         XCR5mecZ0PM9/ypgQMc9uPbcZbg6d9RLiCv4esuqXDuMF2/g99E32qArnhnhA7XRjwkC
         nxsaNqu/TOzu9oxyU7JvN/ygRsW5uqia0rm1+0rw7CKo1eZ1ltX4NPysKLzZ+8wQ4qgK
         h4isDkqey6eu8TYfAKII29j1X4q+5Au3oGu3sw+rfdz5szavzUph1ZQ9Y777IfFBgNWn
         kqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9btm4eeFMrtQH0GA96/+zzP0kg6lFhTNnEdJkODNmGc=;
        b=ZeyuDaieR7AC3Zso6fNfuvX9GNNjYIueS015qZjl8RRN8FZ5ys6gxJogxkWlYwtcTu
         07L2v9xpkiABUo8PA3U0GV3kO67cdhuubS9nsrWtIHPK0PfYpSiDO7+VP9chARkSFRDj
         fL+qw6/ZGqDSW2v4v5WxFNqeNrbaziMz0HNog0BJQ5eIk8jdGO/kvm5DqFBSlrLDMo5R
         KEeut0F2O0qF7ZSanVfDOxYsd+4xadHyIYw62r7bXtu29ZnVl3+FLRoHhFWPdVOYspA3
         quhlnxKKh26z686GijxMCjFLLHvFfYCC+Dak+NxgVGaOLHTgYv3Q8FLkUqyMXKwLF3WR
         DS9g==
X-Gm-Message-State: ANhLgQ2baKSfc5K0i1/dZU1PlWVtdBYze4Rb6CFQyVPp3Tc+aAYOJ6LA
        NkkRraMzRhqkEuDFrLuGNLY=
X-Google-Smtp-Source: ADFU+vsvIoyRlhXrOxD/HtfKnbnUR0FZdOrpIUAdvtzm+9eeA8VBRgCFam54zF23bA1FVvcEvS9Iog==
X-Received: by 2002:a05:6a00:4:: with SMTP id h4mr30689891pfk.92.1585075883638;
        Tue, 24 Mar 2020 11:51:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id c9sm2852835pjr.47.2020.03.24.11.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:51:23 -0700 (PDT)
Date:   Tue, 24 Mar 2020 11:51:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Mastykin <dmastykin@astralinux.ru>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Input: goodix - Add support for more then one
 touch-key
Message-ID: <20200324185121.GA75430@dtor-ws>
References: <20200316075302.3759-1-dmastykin@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316075302.3759-1-dmastykin@astralinux.ru>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, Mar 16, 2020 at 10:53:03AM +0300, Dmitry Mastykin wrote:
> +static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
> +{
> +	int touch_num;
> +	u8 key_value;
> +	int i;
> +
> +	if (data[0] & GOODIX_HAVE_KEY) {
> +		touch_num = data[0] & 0x0f;
> +		key_value = data[1 + ts->contact_size * touch_num];
> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> +			if (key_value & (1 << i))
> +				input_report_key(ts->input_dev, ts->keymap[i], 1);
> +	} else
> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> +			input_report_key(ts->input_dev, ts->keymap[i], 0);

Should this be written as:

	if (data[0] & GOODIX_HAVE_KEY) {
		touch_num = data[0] & 0x0f;
		key_value = data[1 + ts->contact_size * touch_num];
	} else {
		/* Release all keys */
		key_value = 0;
	}

	for (i = 0; i < GOODIX_MAX_KEYS; i++)
		input_report_key(ts->input_dev, ts->keymap[i],
				 key_value & BIT(i);

or the device may send incremental updates to the keys pressed without
resending currently pressed keys (sounds unlikely)?

Thanks.

-- 
Dmitry
