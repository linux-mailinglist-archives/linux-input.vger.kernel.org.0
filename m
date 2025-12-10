Return-Path: <linux-input+bounces-16522-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D942CB1EC6
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 05:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 614A930422BB
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 04:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27A223BF9F;
	Wed, 10 Dec 2025 04:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iopcip8J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8211E0DCB
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765342098; cv=none; b=tXyQFF3XWHhtzXgtCo/ZT/AQSsg+ZEWeT/+xwcsavqM9jHGvlCvi6vcwpfSCIcPi/bh3bp/XXrrCR3ZCAXASW/PboY3loslPv7unPSmimNSdNkzgNHox7J8sgCRSTHfvIyYBEcK/JAOgn2yIrzjrf96d+okzb7kKI5KxOv0etfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765342098; c=relaxed/simple;
	bh=HiXPr3YnNFC1WcmdBP1XHJO/zHZJH28vUst3XPz7mD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9vj5SJVxMdP7M7XbikBd15TvRnZcon2uBK1ZcGTM2JLUpKLCeUyFRK87dIOJwzQR/ar1R2vLUdJ4KnMgCgxIXoknKgPRcCTginF8+/zS+ioM9RRJ7upIkqI8cs2zIftFcldhcxXAgJlULOPsM0XQ/RF7l51Vx2GXna5W+oTpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iopcip8J; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so4458768a12.1
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 20:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765342096; x=1765946896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=;
        b=iopcip8JhoSKZ66N2un3ocpbbIOgRCqX9za54JLhrAn99xFL0OFO8Zk4Eu72fK9cID
         zvt3k3aIWYSAHF/OCDquQphdCkVjtUdJZxB39MPnx54LRL7szhigGKYjQkWIrvv2GnVN
         PfouwBBhEv4ClbRkmhamgyy4n1zw1MACMn5ElYR5mh6pJVLAnCjX5a5UGOrDbTLBDrQu
         7IeJjV3lJu1Fs0+H8Ai8LA/Nle/yK0YBso6oyz1wWQ5GetQOT8XmhetsZ0MFHjfckHEi
         g5akHTzPuKhPyL612v936h4Y6+fhBcMGCWYUoOF6dahVDa7D8rHt9JHpg+fLpf+2UUwS
         vTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765342096; x=1765946896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=;
        b=HbvFhfdE5nQrdG+twy1hnH0Kkw6EqAfvnzQOYpUc9EiNYml2uchPKew+rxUDQIyaOK
         QGQGZ/rIKnFsvKaTCHEp7gVSz++LN6MpwTFtYgAUJbGQry6JngKuvDacwsVA1WEnL9OM
         prZVU3YBe/ypg/Pd25u6aAK01RFQ2CE517Vw5hM8+e9pdjTtmY83E0/hcVHjHMKxxopX
         msAx0d7U4e/xg/NZxUHo2z3isaVWhqTUE5byl/CQ9CjypwVEvKbiatdezBQzWkX3CPQe
         Bkuy6Fil7RqI88DAsI4w8FgiR5wlEyVHELMRMo1iXd6BavV6HaUJa7pd13/VmvdRKGnp
         GEVw==
X-Forwarded-Encrypted: i=1; AJvYcCXH4sqTakZyP4JhR+rVrbY6W0EWZyCGD5s3ZjG8Fevi1DGtBJGufOgrD3f2KBZJxlHXj8pVOwb0qF8Y8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoauc7OUdmR7+c02bhkUDzYJyDO4r1KzdI/X2DEUYdw5gjmv8v
	N87KkkjRanUDJtyfFz7pIBnwcDYK3M42AaZxRt4n1TaE7NT+E2LLNqy8
X-Gm-Gg: ASbGncvCdAL363OEOt3dIMSOsrsnDAGiUGEuIB8tZjOI40GFvLGuoXVCLU5T9xf6EqY
	xBcQuxQ8x+LEg617z1be8cd8Sv1YTTdIDHLTzY0Mm4J/TnHuScPXzqwAX2lZ+WPu9UG3s9LsdEZ
	jXWRV6FiqzscK37bV8yMFc1VeOl1e2+axT+qzLLpiFceL6GFSB2V7jiOJezACSMd5MEBQpqZCsT
	/3CAwIsTjOOhmypgmBim7Q1u0LArmeuMrMSBuXI06AktYdo1dDO7X0kRIir2qsFqQMertvO4G12
	Ep9ZstWaeRqyPdmHk9OqRNW/tK4lFqCX3NgH+jJA1JMk0ephx7xaYm1u1atXK5fl0+IX47+ca4Z
	L/uZTRym8bkuzHyB1DTBIEim5Q3lIw7TDsm1faCTuLdwiArQ8znBs4VNWjhWMQT0aIQwVmvpAha
	ZOC5m0BlfwBlPpqI66YjK+wlpuM+rGJMXuQLD9ANaYPXDrexDY3cIug0Cms590m9U=
X-Google-Smtp-Source: AGHT+IGwhF10o8oXBvj6kF3XVHLwewCx7u/bdxSK0ksb+PGLHRX/iWeDMbigiy2qXuWF8UnfAfUzMw==
X-Received: by 2002:a05:7022:4299:b0:119:e569:f626 with SMTP id a92af1059eb24-11f29689922mr965432c88.31.1765342096391;
        Tue, 09 Dec 2025 20:48:16 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:205a:5a0a:c468:f44f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm72522829c88.5.2025.12.09.20.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:48:16 -0800 (PST)
Date: Tue, 9 Dec 2025 20:48:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	louisalexis.eyraud@collabora.com, bisson.gary@gmail.com, julien.massot@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] input: mtk-pmic-keys: Fix potential NULL pointer
 dereference in probe()
Message-ID: <inmlorhcpi5g7kfs45rhtpwq7aatmzxemgnulamvjqxmmmtl2j@vfcd5kndbhep>
References: <20251210030013.913-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210030013.913-1-vulab@iscas.ac.cn>

Hi Haotian,

On Wed, Dec 10, 2025 at 11:00:13AM +0800, Haotian Zhang wrote:
> of_match_device() may return NULL when the device node
> does not match any entry in the driver's match table.
> The current code dereferences of_id->data unconditionally,
> which can lead to a NULL pointer dereference.

How are we getting into probe() without matching compatible?

We already had a discussion about this in [1] and patched the MFD
portion to not use generic driver name when instantiating the keypad
sub-device.

[1] http://lore.kernel.org/r/20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com

Thanks.

-- 
Dmitry

