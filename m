Return-Path: <linux-input+bounces-12450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18354ABC75A
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 20:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1EE189191A
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 18:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E201EB193;
	Mon, 19 May 2025 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyhFGVZt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD21E47CC;
	Mon, 19 May 2025 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680429; cv=none; b=tUXmnKy40/9eSza/6NXp45k5lTguVzywV2uKw8dszQY3QSVbeQHgWtobB0N//Xr7bdN0kfjIP7f9YpnPX8aBTcye9rcYXXJWnbvMVSN4fhW33nlwy2g5Z1C7G8Y5uN8sG2xktge2ddMytBZ14QSWw+UA16cUZ4KNAYjlteUlnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680429; c=relaxed/simple;
	bh=3KcKFdx5xl1MspdhLEHk7S2gzW4DHTo0zS30Bce7k4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb/0MP98RJgToiPb2VnbcyMSyx2rmMskkBeUIrm7LaCQtV3QgkixKpu6peFL17oV6l+Aees/2kBj5QO8yNAbis6T6phut9wbcEmYyQHr675CDheWxqpCfAuvjKCQ3fwYiJmntXRQaQzad3UK7Cj2bOkEUirJLmRk1YOyAtlbWRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyhFGVZt; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c336fcdaaso37779495ad.3;
        Mon, 19 May 2025 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747680427; x=1748285227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cZWEmIFdIObf+ztRbcTF9qNh0FNXGTroyTNQ5JfXRNc=;
        b=VyhFGVZtkTCcBTxTcYgKFKP0GZAbVW95IA3WJ9Jckm2Jb3IYpGnT4Z1e6HWwabpsvI
         9IAUvINvi0WyQbt5hqQ62L4UNu1f9gOf+NHRRKqjAbaurRlQtmNdVi25Hdz5Qj5R7o3h
         v+CNbN0Kru1kwFomCOWVWwuP0jXThE/LB1KlZb5mIlyVeWhVOXwhQWwGnAn0jroaIyxl
         CSb2uM6vk6MX92uWVc7WoIiSvSqaUTLfjhv8cZz+mi+oaeaRei7YFC7+uM4vMg2mrb3Q
         AvJSGi7h8Pv78PW4rL1L/itkJnPQpipraMl5up8RtmegJZxY3I3JQUO5H5r3X0+HXrso
         QbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680427; x=1748285227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZWEmIFdIObf+ztRbcTF9qNh0FNXGTroyTNQ5JfXRNc=;
        b=ZNyNomHznRTbc97Vq7ig6Ftp/GE0c/mPbNwm3aszjsCsO8YmTnhTD9xaSPXvn1H+7Q
         OkJu9IcXInYPh61TXp4bL09gLZYzoeLCPSRGkapDcOLTq0AqyB9uo3MnS/Et33x+RMC8
         /RmOBAXDFaYovlA1jWTOuf9BFMXll7qDByDExQHPL97q/cxZgsXwDXBvPXttutSYOQ1J
         gha4XqbN7md+AOlykI1v0iUHxMBdzg4DtnTcl78HQtPAcTSuqyMcnHeWsIg31c9JMO5W
         oaaIGorBEM/DD+5frIt2cSAhxAL7rkN5ZYA5lm3xvoNdcNYbdJrubNEMrBiBmUPhfh2e
         Jt/g==
X-Forwarded-Encrypted: i=1; AJvYcCU0G+itVM6+DYzB2xtXxAW5HWp9pgtcnz4uEDkTKm4/VXpLs5Xar1fg8F6pyrWWQlud+EeQOxAI8xgYQFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCa4Bw4f3SmJ34k72Z42srP10up377jFzJwUQaFs+aQoNfRS6g
	9/jEFsnBHcGIDgvUHIFaUjJ5Uh0eNCENJa9kaVOyQoILg62jkccd/l5x
X-Gm-Gg: ASbGncvcR1uS/CC6bmNSFl8iVjVPkxgESHkqMnyBUHcI/ZurvFr0zisXF/BCvQRGvNU
	hsaP63wUOjXU+6Hd3kO4DHphyRW9kC5d8POufMLYcbnfO6jepMehOexwthjbW1PLc2vMVCSWuln
	5bCUBmwU6VPfFM4a6sOOyGV1Pkfa1ueSNrV26TWlBp8qsXAfLtlvch0Vm173o9XwfeXHMAsoKlu
	Qn7zy48BvEh6zHEvu5YVl2QEYCEwtnGiQTQSi2ifCrpuZhZGKx5VmzUn47hldmfUaMQM+xsU4YQ
	CeVTEMts4Rf6YvnJred0PncEl8kQ65OZDmTK6JP1KAINho3PfA==
X-Google-Smtp-Source: AGHT+IEwxbiF3eeLbY1amJLDH6fpAtigXgTBHdENvikT+KSHM5hMFBqOqOSdK5WHngnUgVJJ5zZFEw==
X-Received: by 2002:a17:902:d48c:b0:232:e33:1375 with SMTP id d9443c01a7336-2320e33153cmr143618425ad.28.1747680427180;
        Mon, 19 May 2025 11:47:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e134:a6aa:27:6156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm54756045ad.228.2025.05.19.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 11:47:06 -0700 (PDT)
Date: Mon, 19 May 2025 11:47:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chenhuacai@kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v2] input: atkbd: do not init atkbd_reset variable to
 true on Loongson
Message-ID: <tga35ns6nkmzfmkpzak22pucmuzcbqslfwzvblebbk2oulwlvf@i5mfdx6mlniy>
References: <20250401094154.11527-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401094154.11527-1-zhaoqunqin@loongson.cn>

On Tue, Apr 01, 2025 at 05:41:54PM +0800, Qunqin Zhao wrote:
> The keyboard will not be confused on Loongson platform, so do not need a
> full reset of the keyboard.
> 
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Applied, thank you.

-- 
Dmitry

