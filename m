Return-Path: <linux-input+bounces-10320-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D5A4353E
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964E6188D580
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46402257420;
	Tue, 25 Feb 2025 06:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqrmB6Ao"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F26257429;
	Tue, 25 Feb 2025 06:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464976; cv=none; b=Np1rwGnZ0ztZsH/IgbnoiQzGer15VW+y8AKxrBw90t3mi/oLUJUXMQs28EIRnO0F5cRNW3EwXIKGIGiUsMSrJeSrcy8z9zTqgYvSW1ZM1EEHMjpTvaAQ5lSfbnLa0QEW1ajU7tShO3shMclBSKBgjg6sMw9zp2UwtQmkh106HUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464976; c=relaxed/simple;
	bh=9E4tHldaOh3rJ13NGLgu0713HpspGXzpaub+CWVGSVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYXWmweQnS8SfhpC435PLx17BRjDIw5ELIxhYMTIFj/JQhpJrMfGnIUegEkIKnLyrEHpF8xqwOkY+w4OS5cAaevQJVDQxtp4EyAVH1wqSp653wUgNC3L9n5EXRIvN40hCIVvQluarLKA8HmeOh3AHVJ9AKYB2++bRD+ZnOG17fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqrmB6Ao; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c2a87378so87730135ad.1;
        Mon, 24 Feb 2025 22:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464974; x=1741069774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4+q8/0z6WPZe5ZERpSVEokcuGv3BB2C4ZIRL289vZA=;
        b=WqrmB6AoHdMU0uUIxQMLg9ETVcbmOoYVRqTpPD8ljzbDNOudORFlmCF8UaOxgMP/KT
         /+t/39ov6zTzGquQJO2zVEPYqetbVJw0qp0gYY9EQQOykOhQNwuIc6y0IJgo5a+82dWN
         H1zCfJJ38+AccXA/dke6WqK1QsYq/b0yyGXDdAsGNlYHsu3YmEq+5RzqLre7KIgHcDyF
         rmUolhxMhYL2lh6xaiTz030/QSyX0Jc4qwR4o0jtEZlwHt5dHA9YRDDomIxsCRzhenPu
         XgtuHXZc2+8xlSP8nycktSX3xXJnaPWo+FwRYhT/nCzLpkHQEn/VQ7H/733d4rwTLuu3
         UUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464974; x=1741069774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4+q8/0z6WPZe5ZERpSVEokcuGv3BB2C4ZIRL289vZA=;
        b=JhIY1PrGy+2ANqSZ5hyhSPHpXCVo1WPc1OXq05NumUsSz6JikT/dAqeni20FED6fzC
         gvWSnljetrl+zuCAAoRgTdbKKq8j033p/kIkyTVdgBIQ7HTbqi3bxriG19cqVH2nmZuD
         CvnL8spwiNXSow2gOTC+McRdHD6T78jRzejz+5lWFgDuAiS1oxa/d5ofWFkwhN08hkHS
         7LnROhAMheG28vnqTnl2YngwyLabPx59UAmY7uOpSBppIVHnTMuNmV3EZHFlK90bO3fg
         ozl7zwQxhw0mEsqKOomaCwPsQ1731X42A+uymB/PWKoIrxGDWNdREo3X3cv/IsJJ1Wjy
         7DZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ27dFdxwLHtf2uLM9GOJc7/QCJ61kTe2odmH7USsVttw+5lwzY8Kk0d08nxOiV+hoJsiDsQPHbPdPNe77@vger.kernel.org, AJvYcCUbOeBnZRIglvj6pNly16n9ySlFw3FS6MpHoCLTK0fNo4Ouh1MqlFJbWoYJmqgnRi6OOCTZyNZwNICK3vA=@vger.kernel.org, AJvYcCVhEt5SzTr0Ieoe2oKwlkVmWY4l56wQ8iBzvWUR/cFy+KGGhzXYuiLD1OM+TXCb/9x6xF012nzIxG95gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+V8RoxNoLBr5k6DqnjOcrR0WeIid9U6KP3rE5hEgrhhMgk3ln
	eeUPzPGhrNfFkS1grz51BApqftX2FwApgX8X6mNhn3otRZ78mcoX
X-Gm-Gg: ASbGncs+6BRN9CRu5tV2ddDRi6ZnjQPasjt5tduiWO+VbWz3CY1+HqWj+0WVYav66mU
	qmRx0FVkQdORRSBudgDgNpP/mLHTFUX3yuiFrYcHmtGXlVrv5kqNhGyjhb6MajR6A4fNzW30FcN
	TyYZAkixfPRFMDu11mE5RdJWrUa5mnyzOw5RfnJmnbP0PRLoHy0TSn4Hvp36pX5O+T6wn8EOcLU
	euzz5jR3HxCa5LtPAiTUOwYhooUNZDlPUGG9ujd0anMU6beTXfopJ/o9uTzfraG0KaqWMzKPr/8
	xufyT9HcCm2ts/8wMbIWxEG2x0U=
X-Google-Smtp-Source: AGHT+IFsisg7kq4qoJMHCuHfj79GZoynxTMSU11v305fq5VKE1tV/Xn9I6Jksi84K3R5tdsWMDlsqw==
X-Received: by 2002:a17:902:ccc7:b0:220:e8a1:c819 with SMTP id d9443c01a7336-221a1191665mr295309715ad.34.1740464973913;
        Mon, 24 Feb 2025 22:29:33 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a00054dsm6608305ad.4.2025.02.24.22.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:29:33 -0800 (PST)
Date: Mon, 24 Feb 2025 22:29:30 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Charles Wang <charles.goodix@gmail.com>,
	Jens Reidel <adrian@travitia.xyz>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: goodix-berlin - fix comment referencing wrong
 regulator
Message-ID: <Z71jSubLQIaqGTRX@google.com>
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
 <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>

On Fri, Jan 03, 2025 at 10:21:35AM +0100, Luca Weiss wrote:
> In the statement above AVDD gets enabled, and not IOVDD, so fix this
> copy-paste mistake.
> 
> Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
> Reported-by: Jens Reidel <adrian@travitia.xyz>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied, thank you.

-- 
Dmitry

