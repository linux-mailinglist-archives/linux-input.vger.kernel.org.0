Return-Path: <linux-input+bounces-16592-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06313CBF64A
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 19:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D29B30202C0
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 18:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F9C3254B6;
	Mon, 15 Dec 2025 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9GZYy+Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCE13254AA
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765822520; cv=none; b=J6GLbZ/xkp2oLBGabwak1ez95aznDD5a8Ywr67Oan/gnTPmqBB4sUzLpR3a19D758SFPBu/5nI1OHJwx+vU9ltXj5hV9y97e5i3/3gLy7JndOSJZfrdKhLyifRBgxe9Uf7w+K+9A4WYrOISUShPMLBx/deKCGLuGa2tlh4fkg2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765822520; c=relaxed/simple;
	bh=wHSYXzxz4iw9d0VUHtpF3R8eMRqKahJ1nOdkp7vmIFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9UUjMDFpCJOxjZ4W6K+nIr0ZpaTDOjK8PopnBeu2mLYj53DHbkxX0w2oF+3A0yzVuV6vQZ0wiPveGbRayV6dKygyP8EFv/Lm5k8WDcpEp6QJzrUA3ukccAK/GfIFYt+BPFmn+dOXThG/PUZmFGzkQUhKhTyu/LY/WVAaDnKjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9GZYy+Y; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso2016166a91.3
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 10:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765822518; x=1766427318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbS9f3STa4xxBRj2QOS6UMtxfjxgPYZfENhU/QV+0Jk=;
        b=V9GZYy+Yw3gVPglq6QGTOhz4YN4PyGbDix89GxDsMDEAbcxVekEZ2SRq9zKPe7QScn
         n0ICD0PA0L7NGAD2yoQ1lwovQfMWu4aQyWoPLvjOse4OckJF6Lj57H/2QCY2hqvWEvA2
         dNvvuIm9SYPSmZf2NBEhoiBwFif9mwo63Dp+gMJiLU/IqLRg8bZJvmFtCgftp+834/JW
         8ZniaWLBfMNJxlvO2lEoX8MUv35Cnjs6ArMEaOTKDq48DvAhahpwDZuQpTXZ6DE/BZnE
         NsYd91thFZV2DhwG4jJ2K5iRjpXHYTmJh2ApFlj8s56yusZE9Wsz5xz1a0ct41+uzGyr
         zAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765822518; x=1766427318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbS9f3STa4xxBRj2QOS6UMtxfjxgPYZfENhU/QV+0Jk=;
        b=I19n44/4bcMoX/ZE4fL4I0TjXsyJCDQiWyuwOpzZyjTTFtrPTF2HhdrUMJlRzBw44v
         HVNkDkfCljVweoaqeraroeEyqC9QHDkuK3qGtqqdO+Q65hi/PbzQaZv57Do2uSco4Pai
         /9G/PTOTCsXcwEELP8TFOAKuaqWvCHyeBfJqVzmP2jRVqsQMCD2y2OPEMab8RBNVnGYd
         gCfcDTx0ZSh14sos8AOYuFNx9Gy2NyS4tvMBJjCnAZr0J98uyUBG/yz69ZoWqh+lC7lQ
         VAgPdpOYKILtQAfJTBUhv7v5l1ADavVKwTXm4EVZt79QxCMddLP/HsnP8thsL6nxWRWE
         im5w==
X-Forwarded-Encrypted: i=1; AJvYcCVG4WQU2JyJLYfNOCMgQ1Znsi75p7fBW4+G1i26EBYjtqj6zKix0PXu2GqSDUH4Pv0GUZkgf7WsFj8GKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8M1njsp0Bm9ArnniO1Gi0i+cUhFqNhyXwMt3Vi8PTJDiN3GkQ
	8yU7cxEcHDkZ6XxC52u2avysDurQBn6grBO+HuLz3ILBI0hIb59BQukX
X-Gm-Gg: AY/fxX5etfT+7G3h116ghwrlZ/oAadxFhvr9zKImFA3R3j+SHNZTB5YCrIEKcWKVW6b
	9GWSHlgGbwWoFpQZPW62AXIXn5TbMeMIs6zsCLXOhRs1IzABpZeDDjQbKHuA5p9BQ1q2dpXTMOM
	g+yEV2UhzhHrDx+Pw02ivcQeWVRBhEX+Ui46wnbhnb9IcfmVKEbq7Dxn2Jli6LO1qQAhSPnDHv1
	VxQ7/e543A1LChsDl9Y7pKe9MmM+rfwKs66GMLD/ve/ISOWWduukqwfFcR61JdL5KdUIW0vEt4n
	3tODhmS+ajM+OFR/Nbj02sc7oiS/rBjBoN2O9HiN1zIO4nyeBqvMXv8W2ucExtHUfSi7002p1sE
	3ubR+s0qn86be7VWHqAA1PdeMwKTxoYfEc6fMCqeFdQZTTPasfSpWpicN2WgutU1bOL1aMLn1d2
	HIfwMikz+vt2i5E/a9bWx6qUYVczJ8bP+2Ft+3uS44pRAez+xyGdlwxZSKbpMmdw==
X-Google-Smtp-Source: AGHT+IF08UPaR+NVmtlK2izZJFBnhKg0OpuZEP1H4zuEjsKSPToLbV1f978ZpUy7I6s0R/HG/DmeCg==
X-Received: by 2002:a05:7022:a86:b0:11b:9386:8273 with SMTP id a92af1059eb24-11f34c3056fmr8899545c88.48.1765822517900;
        Mon, 15 Dec 2025 10:15:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:9fc:fed2:5eb3:a9b6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm12073143c88.6.2025.12.15.10.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 10:15:17 -0800 (PST)
Date: Mon, 15 Dec 2025 10:15:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Christoffer Sandberg <cs@tuxedo.de>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to
 i8042 quirk table
Message-ID: <tieqhuev6crhy7mp2oxoxvxi74jbqv2dri2rtqh6qhfm3zibcc@vjwdrpiqkz43>
References: <20251124203336.64072-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124203336.64072-1-wse@tuxedocomputers.com>

On Mon, Nov 24, 2025 at 09:31:34PM +0100, Werner Sembach wrote:
> From: Christoffer Sandberg <cs@tuxedo.de>
> 
> The device occasionally wakes up from suspend with missing input on the
> internal keyboard and the following suspend attempt results in an instant
> wake-up. The quirks fix both issues for this device.
> 
> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Applied, thank you.

-- 
Dmitry

