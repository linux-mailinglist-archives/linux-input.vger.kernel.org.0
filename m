Return-Path: <linux-input+bounces-7068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A539900BE
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 12:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DFD91F228E6
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C79F14A4FB;
	Fri,  4 Oct 2024 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVVJq6Gz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BBD137903;
	Fri,  4 Oct 2024 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037245; cv=none; b=Ji+Mg3EIHFyU3WeqmbRcFxCL9r5lRgcd/70OpuKM9H1zd2dDJp1euyX1a6+1G6NqL0pbR+Y2P4RJKNQHAVmpO7SCZUImf81sSqrcc1XTjc6rClq8G6ls4E4bC13re+MpOBONsuei3CgaeVBnAR7Ejvg76sKJArEN42zS8a9HtaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037245; c=relaxed/simple;
	bh=et2m++R6+ir9F8PGh/mwk3BoLfCKyGvuB2CZckCywYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rvLN1SaWPlEdBVgncm6Oemxk9H7oi/MSuNB7i4svwJoUf6L6QGBaUdkVj5c/6y5xn827s9rOzQxL7vYTIM2KhlNu/HCFUtGf1uLgv9lACOa0KRyIIloOlkSCD9EJ99oTAAW9/ZtF7ympGN0yABD9RxprkO483YN1GyYfWOVSI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVVJq6Gz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71b00a97734so1879840b3a.1;
        Fri, 04 Oct 2024 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728037243; x=1728642043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlcK2sJVdzviWaNlg87cFQx1ibGMSAYFm8r9PjBS/fc=;
        b=TVVJq6GzzxFxTQaswSKVonwbZVMtUdgq3peVq80DbpV6HMzz6RB6A+to8gbchJ6/GZ
         UkYEcl3pungp1/3F90XlExD5eqKC38vSWqyLjmRv+1oob8LJuFWrsxrj3HOdjQzPIZz2
         pB42uGUlxNJZTEAr+KscIpeJkGqt2QsfIRV4I70gXEiI0X3Re21EiQStfTGR67kcA0x2
         zDOuFX0DFlx1dg3jnvZlQaUMNYC0HhH6Qu+Qn1X3/ePX95gN8SoedbJ/IHLOXxpKVYtH
         HQU3jMiUQMmr/xxTxU2TLvlCJ8SVpWfvwgyM9RBrYb5VF92Ldwax3UrImaYGqLanc7PW
         +nyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728037243; x=1728642043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlcK2sJVdzviWaNlg87cFQx1ibGMSAYFm8r9PjBS/fc=;
        b=SJY7c4rInROT/B9G7B+aCblhLAxomRFFufGAmunc4dqTygTrGgm0trqPOzPVXmhYc9
         uDaMP+c+iDsWIWPufhngD5KuGNTC+k/YhevEJ8/D+D2f03wYNON1KDWqQf727FG9GKFb
         fK4hZMcaJLA1osy3Ptq5OoFnMf+WMiBVDXCZ602H5tUzHVQo+hIhCr0oUBUW3xjIhZXM
         NuhsbZrsaMfv+hlyr6avOjd1yoP4y0nycEyu2mVuT+qz4gVP3slnIqTCy3QUYH4kcEWJ
         szHJQ9dVF3ytZoP7Jurl/p1z/hSpAD4xI7fyo+LUWPVSaVGr8WA437gR/4uMJAjcdMKV
         e3UA==
X-Forwarded-Encrypted: i=1; AJvYcCWn6oJ3EEuS/NqjyLplhPTB5C718XWexFKZHUg1eP9/aKH5cCGba6tH7ULZijQRRHpEBtAXphN+F7N7VA==@vger.kernel.org, AJvYcCXL9LCBskQzwsOyI4G0Tw6da24c9WN0/II9ld8Qk5Dpgh5C83v1m2aD/BuzH7PRGgsBwNonp5+X20wQ//JU@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0PCtGImTf54vC05a6AfE3GBh9PLXxtotd75yB1LOiqA1L84/
	8wS90quLEU28N7Ue8C5OUa2KWgky1kVtlHQ9YJ8lV8kACwsCK/lU1oP4bZop
X-Google-Smtp-Source: AGHT+IGemfF7POmkHbsGAD8spssuJY9CkhqHfyNWemVDT3fLErwgl0/J/vcAeDDq8B1SVSR6RROUaQ==
X-Received: by 2002:a05:6a00:1ad0:b0:717:8044:3169 with SMTP id d2e1a72fcca58-71de23b5f19mr3434107b3a.9.1728037243154;
        Fri, 04 Oct 2024 03:20:43 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2405:204:20:6275:2654:2317:92c7:7b80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6dfe1sm2859311b3a.35.2024.10.04.03.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 03:20:42 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: bentiss@kernel.org
Cc: jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	surajsonawane0215@gmail.com
Subject: Re: [PATCH] Applied: Fix uninitialized variable 'rv' in ish_fw_xfer_direct_dma
Date: Fri,  4 Oct 2024 15:50:34 +0530
Message-Id: <20241004102034.9690-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <172803091828.265218.4350721445359526557.b4-ty@kernel.org>
References: <172803091828.265218.4350721445359526557.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

Thanks for applying the patch and your feedback. I appreciate the support!  
Thank you for your time.

Best regards,  
Suraj Sonawane

