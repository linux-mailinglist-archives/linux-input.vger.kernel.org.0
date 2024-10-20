Return-Path: <linux-input+bounces-7561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA61E9A5225
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A4061F2260C
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1CF8BEA;
	Sun, 20 Oct 2024 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpykPilE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45613D6D;
	Sun, 20 Oct 2024 04:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729396809; cv=none; b=t7l4wywFD1HFdyDuA6+1Q0QMUvU2IHvRe7+/rgA98MwbQFS67xIvldbO2mBWirrvG0d4tcjbAffqSONipn0m20jiVEIHYJcA23idOQFVzivjmTUPagP7t/40Yb2AGZ4yXTPh7o3ON5r+d24HgbcEpAgqLYp2JPpcO8Gs5pnvcwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729396809; c=relaxed/simple;
	bh=gEx0+sNstjl7kYtDsIxoAcDh6XLyp0bU/EG6gaF7Rzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCGUDm4cGPDVy5mhT7D00I0e/0dKM8+/03c5fZnIux6GECSUYikEoOn45xrc+9vf7f5u8ULCFbpJH2COYxKNIx4H3rc9kJZ+HFqnl02g+z8l9SORlVe7HNwWjO4Ht/5ZKZt4tkPv+q0vX13Yll9YiPUSo064Cl5f9ey26mf+oJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpykPilE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cdb889222so34037525ad.3;
        Sat, 19 Oct 2024 21:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396807; x=1730001607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7Eyn+wIU2lg/soYhO35E8VzHPCZvDEk6KGPQpopCtY=;
        b=EpykPilEmT7zXW0ub3DFAYAJEY9FsJLNHR+F4A0Q5/6CAPXG27GE3psn+cv8ccqDDX
         o8aeB1NjLnv6e47tT4ZF+yvGwFQ6AUKhW/53ZCcFocHJ8oKYpfqN3nGF03WFJt8jlDXx
         KA/B+MEJPBHC1nfT3/l9mgjkDz1taNAXcdi1m+0ov019Cw/IYqaTAxsdkdj18sCjAmJy
         sBWOLwYOMl/e6OZ07YzFDI4h6RW8tu304w4odrv1wP2kSVMy68Z1qKMr5bQOm3z0koau
         E4SsgVFeh8xxPb5jLdVQjbb0ASSVn22y5bqlenLOw+yy4zWRw0kot/R+/glfSQJHgNyn
         1nMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396807; x=1730001607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7Eyn+wIU2lg/soYhO35E8VzHPCZvDEk6KGPQpopCtY=;
        b=J1d3Kfrr/f9MTIO0bbFGMN8pA09hKfHmM4NfT4vAczLeNqioI0dmmfNoELnsEVBUw5
         tGi/LIngSsJgkRyQy7TJq+ISXm3+Zwp7iw7m2sLwBK6viqd98HW76akgvwooopcHPjpS
         j2H04f4KGB916AHU5PadwigTytR/UFIqC4SVonPrN4lUaDAN2xOB+WZcGrF6GAU3v7BH
         1FsHgQ0K1HV6zImEIyBnq+uVZ2WHQjPmfId9R0uad5BT80fFODOp4aYZCjp0PbaIHlEg
         T84MkHkyJzIfZ+/4rnTs8UJmGvS0l4WvFFErulxc/beCNrtaTxJAq0ADzdAjkh+3LOlj
         fvjw==
X-Forwarded-Encrypted: i=1; AJvYcCUb6eZWHW0UKEbcqS/SWZVulOxq7rcg02Rsjz998d0acmseToKACV+1jpOF7KTIieEvIdSMJXVisLTIPA==@vger.kernel.org, AJvYcCWEy5O754yoemh7U3/AuLCenshVHevuTbjzwp8dfws6jtI2OyuvH9F8tJKyWBM+h3o88YObm+zJPXgIZYvK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hNPPu0jFLZ5thDpbR+xoefe93KZqyUvJPe6zWTDWGOz9CP5H
	Z2ePttRiq/iMmiAezoloeelsJDmKvRsnxBh4QS6nNBP/xNTgX4eA
X-Google-Smtp-Source: AGHT+IFl8N79KwJNzpiOSvPNhcTmGipFG8auJpRWECmsOLXRx2Y646qdQOyM5pwoW9JzQIeTiIpfBQ==
X-Received: by 2002:a17:902:f68f:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-20e5a75a5b9mr91972725ad.18.1729396806850;
        Sat, 19 Oct 2024 21:00:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bf197sm4182235ad.150.2024.10.19.21.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:00:06 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:00:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] Input: mtk-pmic-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSAQ4rWWapwWMRC@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:52PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

