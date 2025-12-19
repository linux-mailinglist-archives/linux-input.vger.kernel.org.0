Return-Path: <linux-input+bounces-16635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0BFCCE96F
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 06:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BEA23005D11
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 05:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF1D2D0C78;
	Fri, 19 Dec 2025 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dhg9/sGm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58418248B
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 05:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123484; cv=none; b=miOJYiQJJvcXqbKtw10EOBxpQ/D4CJAtgq5cEQ33HmbiJpwuTqw7/5QcHuSbZ13CdEdPWn6UwLqppyHB/TNrMDydxnV7NKcnobfLRbvbVYgSWol9JUF3o6/SzouUJ5Ke+4zscqUWQt+3ZesecQVd8nNegjs7TSVnJjXlQFncKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123484; c=relaxed/simple;
	bh=9vn6twG8tid3JeI1jfry6B4VzjD2O1Og88YmDQnzvSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYuRj9j6oXzopMwh7fywQHQ8M8SyHyy+vOpa/uhavBc1p3+RzFzSaQW04QCkTYCJcqpgvF2DiwLxw85jc3+d6rdDQeIUtS9Cx1JDy+lT1vfCJRjvri+Uy+A+62ZdUiwhDlDPftBKLok276Dokr9SFA3ntgUaVrbTeguNz4raDPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dhg9/sGm; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c1cf2f0523eso1016565a12.3
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 21:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123483; x=1766728283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7yns4UIixo00HILO2j5hJ9CHZSrxyzt5EK9Jo0lgDY=;
        b=Dhg9/sGmtrNhr+VTdQt2kWSq/w6yfwV3v8uujBJU/iTntKY7vCHF3LFJL1Pv4ZWPlD
         HagO5nY8m0Q+DYMiiSyxluEe82htsNPnQNc2Jrk7cIQwSxgo4mDp/mrBgaRDN2q0teMi
         TjAdpXaC5fkpk0Eju0iLweqjcIeAoWOlOoOFn1RhmQgIZvsjM9jg5BkmPWfjYfGOhIWI
         GDR4EuEZwi0Cwv+JLRvnEGmn7N+HOSogUbOnSHtQQP71GjhvDrvdhJ/Ft42QKI36OJpy
         uuiVVTAwjoDqp8U7WfFaYxuQ5gJPwVq2h1eRjEqYJMQPz+IHd54AnS0XgIU0ktW63qjL
         yPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123483; x=1766728283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7yns4UIixo00HILO2j5hJ9CHZSrxyzt5EK9Jo0lgDY=;
        b=iFlFGP9vlMtc04qDdgEkNwRHxEri9iz6/t8XraKHSYb3y22QWmHgvrfz/90eOPTbDL
         f9LUlwRGcsWCzTW2BdJSM9tAOdEFvj6ywft3aZ4SUnRBVIsgdHk65EdwLWVEDCYcPXgS
         nBO4DUeb8TIOrUI/MUtZJd1hbqYL29bjfv50uzssCtEg7TnBBHib0+ZboIpE9hJnVEUE
         7GFxKBnEn2Ak8i1bcKZwYUbvPv9X/gViDPf96YEoZzpf/CZw4HmwnpZHmsbGz64b3efv
         xeasC23xNXuGBhfBAiTutkcOHBkDNkYmh4B6z1aL6eHBYczy+7YFyObkalYNd37Y2K1V
         KwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMRYA4Ud47zAYx6clyCIYwuS3uc9Vz0eKiUCjjCkwuxrr+0AvvLUJlnt6pWOw7XeIiU7lBC7Yr5JErkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzri1KKsq9j2m5UH+oUlmbZddMbN087MvxC/UZG32yUEsoOeH85
	g/yn6kPLd/4azlS3F0AbBE6+GK/syWDs+a3kXO1DrzlFa0ILjopAZuKms+qT9g==
X-Gm-Gg: AY/fxX5qhVMlWONl9gXl9wDLA7DF2F729lV+wTfPfpaTFeSWw1XtMynaSSgMD4j7rla
	JQmOsCa4jC3DO7SSdxmLCe593ehTZXM/D5wB5VCASdbMi6LxjjfiZsp8GZYUS2yvVYX4MAjgjTF
	HxAM8KE+4tj5N5x46BzO04RjU8azMrpSXspT5bhgfzrlf65XFkr3x7jfUOIzG29ZEItrLbwtRWk
	HgrLFRfrhTmckZ4FnLpW0PEHsMnYNsRvJlhwNK+BJ92wvAnlTpZoqJdF+r47NV1LTVNupA8v+eP
	cjFdXI1sF1/ya7HyvDO2DOVGEvZDUq5kiXtZ7u09l3L9UDTkujKDD9kUInykBn3iizwH1lVU+WL
	UDc96sQVl70/5IFCvv07DrpbU7+fKvzzhJQwGFYYeNn+E3tIOxqsOBT9sKHEu0PkmU5e3XbBbFC
	SVPE7IGuSoRJJEVs1b0sKJvQur4wWeITGecfK+qs27JCMzOz26W1NO
X-Google-Smtp-Source: AGHT+IHDyTiI7yx2R1vxtm35xmQUGgVsF/bLWJFCF8zWsjAs/z5Q3KFjVFPn4CTa8FQU+AcM6n2A7g==
X-Received: by 2002:a05:7022:6394:b0:11a:72c6:22d6 with SMTP id a92af1059eb24-121722ebd4emr1996449c88.25.1766123482812;
        Thu, 18 Dec 2025 21:51:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm4922131c88.15.2025.12.18.21.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:51:22 -0800 (PST)
Date: Thu, 18 Dec 2025 21:51:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sanjay Govind <sanjay.govind9@gmail.com>
Cc: Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>, 
	Nilton Perim Neto <niltonperimneto@gmail.com>, Antheas Kapenekakis <lkml@antheas.dev>, 
	"Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	winston.tan@middleearth.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Add support for CRKD Guitars
Message-ID: <teqgd6gyokkildpliuvmmbryyiladc5xhkwjv5fzv67xcnsb5p@pnkc3tttblyq>
References: <20251129073720.2750-2-sanjay.govind9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129073720.2750-2-sanjay.govind9@gmail.com>

On Sat, Nov 29, 2025 at 08:37:11PM +1300, Sanjay Govind wrote:
> This commit adds support for various CRKD Guitar Controllers
> 
> Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>

Applied, thank you.

-- 
Dmitry

