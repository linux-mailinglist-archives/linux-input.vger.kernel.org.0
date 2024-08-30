Return-Path: <linux-input+bounces-6032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96078966CB9
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2024 00:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30E7AB227D3
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 22:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153BE18BC28;
	Fri, 30 Aug 2024 22:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjWcnxXr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0EF165F0B;
	Fri, 30 Aug 2024 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725058253; cv=none; b=VFk9uRfc2bbK04uFr9MkgetqqtOxzZwNE8BgVhNWiopRG1IkOWQpP/u0RZENO2T9Ikfp9WrnS07VJT7GodR05L5aKRzT00TrzbW/ca44st5VtIakLv5zI7BWvKyi2YDoDkfy85hx0sVbqdT0IQUo8kOuaNlF/s8oBNCybxXqZQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725058253; c=relaxed/simple;
	bh=OLTIlPpa+v4c60pxBvkB0sb99UmhCoAw0VWc01EiOB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3f0TNTm+cVDw6QLw9etTfh0+AWF/ftMKMO1B8Pfhli2raJJ4Bj+nE+FMyuAlcMVMw8zIXzuNHHVK+msSelWlMvNZATuC6rT9y+yZo1ByJ2BBWvUsseOzduxmhM/fWRVdQH3ALclPY8h4COTGh82O550Zf21lN4icihwctNeU34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjWcnxXr; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7d1fa104851so1303599a12.3;
        Fri, 30 Aug 2024 15:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725058251; x=1725663051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65LIKbIRP/1nqSoA8pyNVDo/Zs1EoaJfqqWrC0sNrZk=;
        b=ZjWcnxXrWzv7fFR3ocFQA+QglscI+xV/m3qr2pbXU4lxr2WLZYWQvlElpqqoo4/S1K
         A9fyqQXrRZTyXfvQhlaRxLIhZPr7JbOYge7vBEViHGBY6ZnemzwxzmXUgWOc7h4qdug3
         r6ehF0gQsoCNyQUdoDBHG78nZQmObqD7cAtKLi6nMZi9FJXpIRmn/YA3629vhNPOnus7
         mO5gubiTVPcWx3VGWuiswplgn2eZqBpNI7OuyGffq2J8U+GJGP4Wd+Gwk12J9spoYTWv
         vtUbuepnwWkEtG97tPCBd+q8VmbmBvdI7dqXgJYxwLKYLD1fkYbM/9S14G9JLbFqxeU2
         V/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725058251; x=1725663051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65LIKbIRP/1nqSoA8pyNVDo/Zs1EoaJfqqWrC0sNrZk=;
        b=a/hk2yGbND0S4OUdmSk1K6M0e9Q/fDv55RH2VlCncOvQqiQW7ZWdouDTMXR1qS4Uhy
         zunOJKazjz8PIWe4i5EDfRPEKFe5fAZGid/wVM0neKdF2Cq8lGoNugKvyxAScE8br5Km
         XJhfXEmKBiPdjjyYN/Pig8WOCegvqSvnl/CGG+n2Xy+NWyYStaUjaOq+8KteXRqh2tZV
         vzlUHx0G1Uj76+zOju7bwV4RGHUephnr+S9oIAEyoInGNFCB3tnC0PeNkD+eAk2fYp8d
         qs3LnnZFubvFRoN1cLh3w21VBmgQhdK51aERc4wcjqCMPn+Z4Pybn3d5m1vjYJSZk90r
         Zffw==
X-Forwarded-Encrypted: i=1; AJvYcCX5IYsXnTyh9l3mQj364IhsELhkTmKMIrISa5nNt9ycoRw05VUF7K8HzI2anIG5vlPAlO7xDCtBqa43@vger.kernel.org, AJvYcCXMY9vm7ZA5R/HpJ4xDNxkmyGMoj83gRehC1BH8L9dhx9oXSQXW7WgYdekW/O2s/VT26DWyY0bnW9HJbKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPoeHHMikCCeWe7K1Iy4hn9GLX6vn/086NT7vp1klnbiaf0UA
	meqT0dSGdcpsRsB68vsr3RwXmEKEBZwM0iA9BPkBnzm7xKoENvzX
X-Google-Smtp-Source: AGHT+IFj3tUQDVnRHCVW0OPOd+JfJPvohp2+ENJAsJ6FBawIv0bVWDU2WiZ05D8IkNSeGPF2diTxDQ==
X-Received: by 2002:a17:90b:224e:b0:2cb:55f9:b7c5 with SMTP id 98e67ed59e1d1-2d8561a1482mr8376670a91.12.1725058250662;
        Fri, 30 Aug 2024 15:50:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bf97:5ce2:737d:1e6f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d84462afb6sm6939409a91.33.2024.08.30.15.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 15:50:50 -0700 (PDT)
Date: Fri, 30 Aug 2024 15:50:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] dt-bindings: input: touchscreen: Use generic node name
Message-ID: <ZtJMx46dqn9HNz4T@google.com>
References: <20240830194331.3774408-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830194331.3774408-1-festevam@gmail.com>

On Fri, Aug 30, 2024 at 04:43:31PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Node names should be generic.
> 
> Improve the binding example by using 'touchscreen' as the node name.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, thank you.

-- 
Dmitry

