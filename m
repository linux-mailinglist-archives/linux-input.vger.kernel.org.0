Return-Path: <linux-input+bounces-3984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF428D5D64
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 11:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4A811C21E9F
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 09:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF68155CB5;
	Fri, 31 May 2024 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MP/0lW7Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19E155A47
	for <linux-input@vger.kernel.org>; Fri, 31 May 2024 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717145987; cv=none; b=cTcoBBgGFdjAVkfvsedMrViCNWLt2AMMc7virnvALJth+cp536cM9n/2JQxCQLzjDhe5pc06J00osUVozL6r/pVeW3U6iCWM/EMe0ISfbtSSqTMiFc+eslvEePXkTHmBjwc/JHHqQUVRMiF6rBGnDX2epmakg8lv3XMVuNNXytA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717145987; c=relaxed/simple;
	bh=jOivSIzkd4jtGmFStyLd/I4XqpFlRP41SuJUQMMG2sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHKVzqxSu+JKyfJDn2BBK5fc6SDNrp1vcbbPMZMj1KkTxB7Stv8PZXI2jfiWqodqJFGYQnEEHaTzfhXld12O8qfDAHnkMbAOwWsMjTc8BWM5UXNqHjbFDcpg04Gxc7mmBfDYs3J+puPX9cUBazcXK9WB40P6wEMKNmhN3vXKNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MP/0lW7Z; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45eso2075741a12.0
        for <linux-input@vger.kernel.org>; Fri, 31 May 2024 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717145984; x=1717750784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEAJOPIhEWOmImkEnnoVh+jLPad4uMXeH/NY3H2GRI0=;
        b=MP/0lW7Z7Gx7/lw/h/sW3uhHQB3eVQSX9BbobHhUfN4vFm6oIzytGz1b+7N/9Zx6AV
         r5d4UMWjKYoqik4cmwDKP78Hv1HaZgj2K8HJ9a+VFmpovr1RTDc3MWdVWmWKD7x3J+fH
         FuP//KfOjqJR7PvUVxnrXQnVrp42Y6ch5tv4SVhDp+jB5bqGQpF8v/Jh6zG4r34mv72h
         /6wXe4WD1kHBhAM4mxuSo/GK1gNxPvhWWCwpPkJXP04V1Mt/3g1gEGK6OYvaTlwRDxt6
         S73FtD+MLwj83nyRNMVd9pSXUwwNdV7jY3t3w5khU3Ql2f7+uXcTeh6uSpBToPfl0Hcy
         4z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717145984; x=1717750784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEAJOPIhEWOmImkEnnoVh+jLPad4uMXeH/NY3H2GRI0=;
        b=XXy7UintRd5yryAffLKZtYTIvj5G9PF2IEBuYWnxV4YQ7FgxBf/px35AcXeL5aBRMe
         IBs5p9RMBc+9MmSt+D2GbNz5tAz+ORbDhyyRFERZIZcWET8VOoOfGpZppdcoF59yBJFN
         TW39hGl4mrryLRIXjJBoes3EK5OEGLclLwMcgwppeD6XfPqyTNJPl++VwN2l+hdGEfvL
         i80HxSN7H78LM3B5c1u92r5oBBjhjh+zgzD42qK9zjBcNhlFnmTz5zGe6RQwU+Rsxo+6
         5szrIHlH5RCGomUGzZ3EWIlUvyHWryA/mHXJwvoGU1ffSjjKT1oRe+pqNSb+eP2KCGwR
         wicA==
X-Forwarded-Encrypted: i=1; AJvYcCU6htbaHBoGpmYcK7oETukKa3Gz72YeHU0gdVXpjjz1DRog2xgTd3M8Zk6n0Ey0ha14qbwzytvTcMIcmjirp8acGgIMhi7PUyiDZ84=
X-Gm-Message-State: AOJu0YxZV2bueOsprBmJ56dCBBcgT4TZp1o5jxicgGp8yDvfW/QT6PQw
	sZYZ6HDN0y3WmtETh6rcZCG9DjtBMqkpuXOzw63QpyYCsdVjQ0mQ28prrWUMEBE=
X-Google-Smtp-Source: AGHT+IF/+rHvuamC5rV6HuoONHpBWDQh8Vzl/UQvPqxXxUfAJx1CxKPhaOOB+FzJQ17g2/141Srb7w==
X-Received: by 2002:a50:a414:0:b0:579:7b6c:5ab3 with SMTP id 4fb4d7f45d1cf-57a364e3615mr984027a12.22.1717145983629;
        Fri, 31 May 2024 01:59:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9c125sm770024a12.90.2024.05.31.01.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:59:43 -0700 (PDT)
Date: Fri, 31 May 2024 11:59:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com,
	benjamin.tissoires@redhat.com, bentiss@kernel.org, jikos@kernel.org,
	jkosina@suse.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	luke@ljones.dev, syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] hid: asus: asus_report_fixup: fix potential read out of
 bounds
Message-ID: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
References: <000000000000915d550619389e8a@google.com>
 <20240528050555.1150628-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528050555.1150628-1-andrewjballance@gmail.com>

On Tue, May 28, 2024 at 12:05:39AM -0500, Andrew Ballance wrote:
> #syz test
> 
> there may be a read out of the bounds of rdesc.
> this adds bounds checks
> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  drivers/hid/hid-asus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 02de2bf4f790..37e6d25593c2 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1204,8 +1204,8 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  	}
>  
>  	/* match many more n-key devices */
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		for (int i = 0; i < *rsize + 1; i++) {
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && *rsize > 15) {
> +		for (int i = 0; i < *rsize - 15; i++) {

Yep.  This looks correct.  Please resend with a complete commit message
and a fixes tag etc.

>  			/* offset to the count from 0x5a report part always 14 */
>  			if (rdesc[i] == 0x85 && rdesc[i + 1] == 0x5a &&
>  			    rdesc[i + 14] == 0x95 && rdesc[i + 15] == 0x05) {

regards,
dan carpenter

