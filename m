Return-Path: <linux-input+bounces-14168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 948FEB2D31E
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 06:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 783642A3CEA
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 04:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255F7194C86;
	Wed, 20 Aug 2025 04:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdwOKaHo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A8918DF89;
	Wed, 20 Aug 2025 04:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755665009; cv=none; b=JnL2IrZcqAHr4m/YLYGOU6A+UkBshFl9Zh0RoVfPlrtEf1JSFHH+CBYb3Sp6ORycic2OCJhBErMl9H4jjp1/6Wsb1Pe9KeMbxhVSQMDe2kd23ekMRh8KIe6RYdjBy40ckQCKylcCuItK23LNRunBF1rKtcXMJ40AzMbQ4dK7Dj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755665009; c=relaxed/simple;
	bh=PvJ8yiec2zDlFgiRqGQj2eztANgyks2Z0hPEQ6+7kU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A2M8pg9QHNrlLMGrK1bROCrnpr2suPgQt2XEAk0I0Jw+6jaaFaMpX66eddcd1MHXOVnCz7PW4hjt4m/hL/Pu6AIWCoPCv0xZzKJesQwSPo4c/axR3sdzDYZvpXViYOJnSyGcCeVC4d/xM9OEoSzCNVnjaURhnKVBkS1QJoreP8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdwOKaHo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e43ee62b8so3157725b3a.2;
        Tue, 19 Aug 2025 21:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755665007; x=1756269807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95tUvmzwH+TBc1gLiYUyjOusAyAgExxDjTEKTJk9b94=;
        b=GdwOKaHoD5Y1OLkoguIAyV/jKotU72hqqS9uaOQVbQTfvzcZZKmBNJno5Wl9jmdhQG
         u15UvwxFKPX1MIy6xnUCEkYglNlCglQTaLpoOqqNpAu5E1s+vglQUH22iSslG5sXcZnD
         ghKo6KVmLdGJVA7FVxfY+oNwUzbHcHfbDMkchdBx2eZve0gomjSg/7TS8/TQHQBNAnLK
         VnoOPsBVHhrcDehXQMqcckMVwklNjxNcv76wViQ7MmQlto+Bm4+f6nV2DG0s8BGEZrc6
         807uKtQETMbHapgSZ7T2zVcNdG0bOuZDQmXNczUthatBhzdJCdG03D8LvwF2Jhc0LIN6
         9nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755665007; x=1756269807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95tUvmzwH+TBc1gLiYUyjOusAyAgExxDjTEKTJk9b94=;
        b=WdQR3MIrrA4y3tIIRT7dxi8wRZXSCaZcoqsy5lhQbP/IWCo4m98euy6BvFkzjZh7QB
         8NtCugDhk1/Otawtf8zWYArjEk+Wgt5EiPz0i7+3HhHcCjv43kcuRX74BcECi2rwAlS6
         jz1Zs8GZ3XTDfpu/nVY9N7mBkuFUNtLnsJr1jzd34gh9TaxssKxH5Z6pCWV2vZEZIheJ
         c7BRfoWWqI/SN1gAlPNUblb1EIJwFb/fy9X88EYTSZB8iN9EV2oLylRtBgNiKYWeacvi
         a7Hl+YwSzZF6SC5lQIMfZsjHj5JnvuLMq3vgQByhrYYT7p/7kHcsB3C4my8SDR919m+i
         LtSA==
X-Forwarded-Encrypted: i=1; AJvYcCX2sqcQr8SQwJzvI7e/Hw4Q9pBzBHchxjXx23E3gf7clH55XjSJ+BoBxvEobTXimyAHqfg0FlzSHMywdPRe@vger.kernel.org, AJvYcCX4fP/xP309TFqmHjZ/sWMu56vbBNgmQKW90X97AZJcqaFfxAjtx/eN/JLMxqmIq/apVQSBC9szS1W1Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOworXm79u7ljJMFG1KQr+6ahjM0HCxEEUSjnzUVf5sw8trkKS
	vb5r33Xa7EvVRlK7/7DhmziUSAkTmbvFYFvcsnustRVoD1txZ+9pfb9L
X-Gm-Gg: ASbGncu8/2qevqV60DZ1Lpo7nUa75MHLn0lfXhlCB95fSBi1Fo1ZEqXiqWhuQtqbBER
	DriCY9PqJLZCiDEqGk2bDQs3cCbLcrp3n+Y6pM0O1iYAR8GuouEMpvWt90WkNypvrWUGheVtOB6
	0gW8e7iJhawlQufw4S9poQnPXB7r/VA7zg2oNceYPNlyTrsbg7XAPUOCOw39ev0g5Ejtj7XSIuv
	I7T++VEUPmoBz43wYmPciIwCRnFXKv8n3O1G+v7SXoJVCN2mLC5oDVAFojyEaROaMA4kRQq6aaz
	XXqO4FAch1oiDrSzHuF64J+RhQ7TF7gS/upJ3qzLfhY2IvoorUhPN3wjZ9Z0XFahD5LgsWrK2By
	38419n3UiJuETVGTt2EIfJ7LIwogWvfKHOhheg04Ydv9YQ/EVWQ==
X-Google-Smtp-Source: AGHT+IH6KdHis0P5lSFfmLhaRmFKn0283pNYeC7lP4mRRz0StH3F+7AByrFjqFypIi318IJtesaQbg==
X-Received: by 2002:a05:6a00:22d6:b0:76b:42e5:fa84 with SMTP id d2e1a72fcca58-76e8db7682emr1822188b3a.7.1755665006974;
        Tue, 19 Aug 2025 21:43:26 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e8ea037e4sm899901b3a.31.2025.08.19.21.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 21:43:26 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dtor@mail.ru
Cc: aha310510@gmail.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x0r@dv-life.ru
Subject: Re: [PATCH] HID: axff: add cleanup allocated struct axff_device heap
Date: Wed, 20 Aug 2025 13:43:21 +0900
Message-Id: <20250820044321.918076-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <fv32i2ejsupm64mpadzsfudaeuzkavkazpmnn2e4ijqeobl4gs@porr2zpxn4aj>
References: <fv32i2ejsupm64mpadzsfudaeuzkavkazpmnn2e4ijqeobl4gs@porr2zpxn4aj>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Dmitry,

Dmitry Torokhov wrote:
> Hi Jeongjun,
> 
> On Tue, Aug 19, 2025 at 12:43:02AM +0900, Jeongjun Park wrote:
> > Currently, acrux hid driver allocates heap memory equal to
> > sizeof(struct axff_device) to support force feedback, but there's no code
> > to free this memory except when initialization fails. This causes the
> > allocated memory to not be freed even if the driver is detached.
> > 
> > Therefore, to properly clean up and safely manage the allocated heap,
> > must be modified to use devm_kzalloc().
> 
> You have not tested this, have you? The private data that is passed to
> input_ff_create_memless() is freed by ml_ff_destroy() which is invoked
> when input core calls input_ff_destroy() as part of input device
> teardown. Your change introduces double-free. 

Oops, I checked again and realized my patch was a complete mess.

Thanks for letting me know!

Regards,
Jeongjun Park

