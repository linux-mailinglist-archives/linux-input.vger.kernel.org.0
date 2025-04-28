Return-Path: <linux-input+bounces-12056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9794A9FDBD
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 01:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E69189CC29
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 23:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF261531DB;
	Mon, 28 Apr 2025 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fK2TGywV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C328F6C;
	Mon, 28 Apr 2025 23:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883018; cv=none; b=QQ6SUf4ncHjYnHlyYDBGrs33isDwXTnqj6NPz7bZeCfFSh8EKEiD203E5Y19i5OX6w3DNcp5RZlgGbk6QG1B02zxT1cweSDeTqMjH/Gv06E5yaoNZLKPVoMhtRQT+g9XHvaPH7QwhJy/Fmzr/+CJzR3YFJJahcuH6bq20n/CZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883018; c=relaxed/simple;
	bh=F7nAHUG1vlKvXc+NSAIN7inrJkz5k8PT0zsRKXQ7UVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niJpI15mSjix3IEIFo9G0VfGzEc2zofu2zAcVEehFtpkVitQ8FXP1BdyuX5pAnH+5LPir7ai6SqGXx413Ktexjn5BYEEu5kUXZx3Chp67BItFI9df+LRGTtfqMErgUCxLHJDcBYg3Ej3cJaBAxweduAIaOuA1rSY7nFFX7756vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK2TGywV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73c17c770a7so7260284b3a.2;
        Mon, 28 Apr 2025 16:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745883016; x=1746487816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=329DdKPNLhWNu0yFa3+5T6Ux91V9gVZ7UmzQBNCxNx4=;
        b=fK2TGywVakT2A6wu4din6eurbLvmg8GETyPiZKoMQEAeghkMo/Lty4L12JFN4dKtVk
         GyWZIY6kxJq3F5z50CGqHGtqjObGeYk2AHrL1bupUQm0RGTP2YgNh+jiL/KgdESXMeYL
         tqrBOWcbOtmeV0mQ2rrfD6ofbJM3BKsTJdyi5s4E8TFfvAS9z/Xil/54tvO+HzxeSl7N
         XKqHmAVdMTCcD7Nsk9dbpoIxlefHk9L4PPBTjP51bwUnFXBjmz+lhJ6g2TGBOCIkeBTA
         cFB2tO5+Ly08K0XPWwaTQAGP/FDE6qfVP8K7JivOk+mjzMpjFfiGiD7gcZMIoeRFIYz3
         VOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883016; x=1746487816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=329DdKPNLhWNu0yFa3+5T6Ux91V9gVZ7UmzQBNCxNx4=;
        b=Xs/uHn9MmDMaVAqJSS7ZUJKi9FBDUUJd+0olbWNXbQR+OH8aX2HLtmET8nYwSQTmX3
         deVY7bZT2ErbrFZ0WzF9tIlQV05hPYB47KCkfv1QxbV630rGGnf5eEuaV7whauK4wrQ6
         sVuUTKWzqL5/b5ck4HcYLmCx4IFE9JCeycT7vNDdgoAfL2qxK+OKfp4NuWtqsPSeUqqk
         7alYApCjdopdSEiGeSsjJRpsRTST0ms333bgS1c3sfFYyO1IjkrbrIIBLr9AuxdY0vB+
         hmc8KLCk8wfwnloa7+V//Yq862No7nqG3kILI4e7IJgnFjLBiAC7xVi+d5WzgRBBQwKH
         Hniw==
X-Forwarded-Encrypted: i=1; AJvYcCUt8AvlPqDiMeVf5WYyL6CoimpII0cc9emyYT37PUXacEP7FsqYqoSUSE3CdKxx/HAjN6VHkz4Gjwb/V7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/BXw9bGMHPh8q/3pygd8PVoIZezbCho3yX7wUyNtDlWhaoYP
	jDRqKQHUv5uSyhCDx1rc4E6mh9zEqaNTVpONFHhSTNxRmX6DM5Ct
X-Gm-Gg: ASbGncuCvyGO6xRJZymWh1vFs/k7+OCuZrYUVoH2TIs/q55iMv+vnowoCKNqYomPNpn
	ihrLe6P+lPAJ7WMhenRbLXB0WoJQW+VPdthF1Qn0sa/52R243oda0GQGdFmnhY3p2srk1WXJOnq
	oVCr2IBH5ICeyzp3kF2Ay9BVCcpQpMZho92kixtX+VfloOfL2VgIvAqrqpqzbcaEG4g36n4iAco
	ejRn+MOv91Ja+wKpJzLd/N4NwI7G18rhUZHhxe7H5Tdkw91wK4KPjZRdailFEYX2gbus7MuLf9N
	SEF9x2sWVwBEnRp04g0W0jNgFqA5T9FeNNQO9nlz
X-Google-Smtp-Source: AGHT+IED5O60hq0KpHF5uKP5cHq6Mugo5SLPYclGsTgHjYasQquAhjcqADeNrr8vHqGI2Tdmmu0Bug==
X-Received: by 2002:a05:6a21:3a88:b0:1f5:8cc8:9cc5 with SMTP id adf61e73a8af0-2093e029812mr2343382637.34.1745883016546;
        Mon, 28 Apr 2025 16:30:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aa0acfsm8584146b3a.152.2025.04.28.16.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:30:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 16:30:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v1 1/1] Input: ALPS - bail out when device path can't fit
 buffer
Message-ID: <ybenmz2fmjxjpo3zhnrh2ptquikxrtb63664qbhhfv5d4ezx5n@c3p2tbosx2tz>
References: <20250422185645.1949391-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422185645.1949391-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Tue, Apr 22, 2025 at 09:56:45PM +0300, Andy Shevchenko wrote:
> @@ -3094,6 +3101,16 @@ int alps_init(struct psmouse *psmouse)
>  
>  	if (priv->flags & ALPS_DUALPOINT) {
>  		struct input_dev *dev2;
> +		int n;
> +
> +		n = snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
> +			     psmouse->ps2dev.serio->phys);
> +		if (n >= sizeof(priv->phys2)) {
> +			psmouse_err(psmouse,
> +				    "failed to prepare path to the trackstick device\n");
> +			error = -E2BIG;
> +			goto init_fail;

So you just broke touchpad of some poor guy who had it working just fine 
for many years. For maximum impact you should add BUG() or panic()
here.

In all seriousness, it is OK to have truncated phys, rarely anyone looks
at it and if we get a report of it being truncated then we can consider
addressing the size (or we can decide to live with it truncated).

Thanks.

-- 
Dmitry

