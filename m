Return-Path: <linux-input+bounces-3779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188C8CC735
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 21:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ECCF281AD8
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5569A142E6E;
	Wed, 22 May 2024 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2NYKq9b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC287F48E
	for <linux-input@vger.kernel.org>; Wed, 22 May 2024 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406210; cv=none; b=tQ2WB3Jczh7HWg1agctAaS6jCI5WD1Ps466lHOLbeAPu58U20/MfYmjFCKNuPeN1IU5/SIrqWcbRM/ANncjQune2zm6+yMSdZDaRpCZzYZI0fp/1sNUAGUKKrtbzTg5ekrwwZ9iYNRQJpyaK+PpnxyQfJzQLxTxEVUZyt40a5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406210; c=relaxed/simple;
	bh=pmbb9I9f3YNoerhGkztwasuYbrJ9fb0oA2rULmUbE0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgQEGL+O2bOymo8OWpyVW9+GgE+Kc6XGLS46caE+WvU6KG3EJ6axeqjEFSPpxr0YFNHVzm7ekqxl6xqtvDDK0ASfY5w779m/O3Y/DCbJoMK60X5bUwyo+r6T+mM0FE0h3XHUGvib0lrqHKUJgslARdoJ7CXmPrSUX4PquO/uxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2NYKq9b; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f332528c1aso4429115ad.2
        for <linux-input@vger.kernel.org>; Wed, 22 May 2024 12:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716406208; x=1717011008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83ixq1Qpz94sFyq9RwHau28znYtqaytT7nwn2rw/ofw=;
        b=a2NYKq9bUaxnKdUob5oOakbWuJNZmAEnGbbLsQfOw61kKszZD0hm4voNd/J2xl+T3Y
         2pJ1ED8nWuGMThqA2wxk2bXyFzRYYCCGOC6I1dG54Br1/Iu21CLq8HPgdQCiJXsA6ZU8
         TQ1RiP5JlZKCGssDaG8cN+c+2SEKBFXR3yMSRGEM87NStc6jUKErzIQgdXsV/ugEULhh
         0W8/ykEXxvrg2TPOW99V7M2oB5DZR/ItX0/XFvBM6xQw+/EAQ8Y76PwKs8h+n6ney9Nv
         UH3ftHqgOI98UNQqRs4DIcOa1A2P6XmOuYD+JL89kX6b6ZQI6Sj571VNqVKLUMsxaBUf
         2pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716406208; x=1717011008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83ixq1Qpz94sFyq9RwHau28znYtqaytT7nwn2rw/ofw=;
        b=qo9qu/6WIjs0Wgbgp5QTRZOu4LwPZ4j+sgfrAGlouQSjCcImLwkrf30NVld76uLrQt
         iTZQM1xgaRxWXDErrsVteYxsNgnbTx9oMaRg/bgw+ElSAlIya/Bic/phcd8YQcgds7Q7
         MqbMdev6PR5ncfg4w/uKW4KNJhGk7VWYCFes4m4iONkjtMj0R2Abm4SlXBHxrlAnbWlv
         26cqQu8PdU89coYAoG/UlE8oQu8O6geK897SJBideOIbOQsem3xbxH2aXW87AzrQu6LS
         kC6TfyOY7a5HjEhxwcQ4F+VxC0IdDG7xrBviGc3eMltflIsoeI9lgFju5h9Be4Q6xnau
         1vdw==
X-Forwarded-Encrypted: i=1; AJvYcCVYQPHmPHpUziLCiY1vIbbzyuowF1SfilYOcCU0jKi1u2HW/TJ6vFxXLq763kenUPPdu9tHyNyWrlG5x970sdLmgJ/xBXLAbiXMVrE=
X-Gm-Message-State: AOJu0Yx6gjRSqYjLqnRe4CLeiS/UsfvUH6f77UeziorOLyikMKgd5Xmn
	mT0A2cZQbyDGt28U7p5RVEcsQXCxasE9jVJpo1N2TZANbMfwbgdr
X-Google-Smtp-Source: AGHT+IHpZLdjqilVe+rzdT72jjyCvXtTq6UueplfwMcrnq6nA/+Kb3gvDo2y6JzQYXnmU5wv96fe4g==
X-Received: by 2002:a17:902:8b84:b0:1ec:4695:6759 with SMTP id d9443c01a7336-1f31c990e54mr26503245ad.31.1716406208229;
        Wed, 22 May 2024 12:30:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d9d8:1fc1:6a1c:984b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad6176sm243701035ad.76.2024.05.22.12.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 12:30:07 -0700 (PDT)
Date: Wed, 22 May 2024 12:30:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v1 1/2] Input: psmouse - Expanding the psmouse packet
 array
Message-ID: <Zk5HvUtMyWU1dssO@google.com>
References: <cover.1715224143.git.zhoubinbin@loongson.cn>
 <714216496603cd23c18d9d3e1cc52d8ba21e386d.1715224143.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <714216496603cd23c18d9d3e1cc52d8ba21e386d.1715224143.git.zhoubinbin@loongson.cn>

Hi Binbin,

On Wed, May 15, 2024 at 04:58:56PM +0800, Binbin Zhou wrote:
> According to the current design of PixArt touchpad hardware and FW, our
> single packet data width needs 11 bytes/15 bytes to receive the complete
> three-finger/four-finger data in absolute coordinate mode.
> Obviously, it exceeds the design of the native driver, and we try to
> extend the length of a single data packet to 16.

Please fold this into the patch adding PixArt protocol support. There is
no need to make this a separate patch.

Thanks.

-- 
Dmitry

