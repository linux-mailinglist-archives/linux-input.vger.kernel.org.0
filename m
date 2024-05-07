Return-Path: <linux-input+bounces-3546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE88BE1E1
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF90E287D7C
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 12:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7E8156F37;
	Tue,  7 May 2024 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TP4B4qc7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9D136E2D;
	Tue,  7 May 2024 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715084386; cv=none; b=b0ppW4ThixTiG5oTiGehwB1op3ir/EZFLYn7DOiBseyLTsBm14TKZn1Z2V8L3Zqrfz4KeNFDNHjDPAkagXLOia6lUTb3EUP3IgkYoA8TCVTCkWyqU/BMg1XRyqCpYyScIdmQdLUV8OV3P9y1SiGrPVk6zpX4xcwYjGQbP4SDjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715084386; c=relaxed/simple;
	bh=YGysMvCWu5RbV+Xk3fie7lVqrYC9JdPd3T8gTRCAhYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+8wmS/i322o6VWN3dHd+RP3gqhxFX/oajCD+iPLygg+hx6hwfSSMur1uzW5wUHlp6FSPtGiZ/I+n2SV+wK9PEFXIP4eA1o9UpN0hGngXK/z9wa2Wy98jJQ5+RNQcwo1bOCHFUm+CDjYv/0UFx36dLgwxJ4vYkF5fw/bfr/i3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TP4B4qc7; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f44b296e02so1503079b3a.2;
        Tue, 07 May 2024 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715084384; x=1715689184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGysMvCWu5RbV+Xk3fie7lVqrYC9JdPd3T8gTRCAhYE=;
        b=TP4B4qc7ekvwz96An6ybwPTtN9BxJjDb7cT5Ty42xXL6t7cDyezQ5pxmnXjCo5xs7t
         3o6WzneJyd2GzSn2jv6FhkHtLtLDLdmuzOvpPA9J+NS8B4CROiUkyw+mIg6vnCG/AXkg
         9xnIff+DNoZ+i3ZWmtQObr/oL+004wL00MwpXNf6iyUNRwK5XqOF78bj/fTxYrpkXC23
         Vj7amXfPwxy4On5K5B78AVh7VFbHhvcYikI2iVtKPk3e4pRdBq+pFjKV3823GPRo17Av
         zyvMAzw7ecwpEIemgnF3s0airFwCSxR13STgj9IBLliMvQH0GUkiRvqZsDutXuEvw4P8
         Hpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715084384; x=1715689184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGysMvCWu5RbV+Xk3fie7lVqrYC9JdPd3T8gTRCAhYE=;
        b=HYPydeRBx4pm5N5Kpu/OmIVkBjf4OZRfQJtjL5v+kXtvPWunmgQr1u/UHfmsRUhyvu
         yVwET5lmdrm48os0DALb+qVSWcN9V6W1Z10H8MR8i6oQBNDyrIY/5oYKerQbxkGPuLU1
         tYzAD/L3fA9nDGRFOdbI4FhTBN9Ybj1Ewf9M5wOIZpakYCGHREKDcmjWq0vA4eijmn9C
         l5OC8nondLTmuN8dsTTY2elYxkxgyy/HnjaxogOH58GuTgCGgUDCMFpPvf1I5H7+v9m7
         3pG4pBwclI2gxeZX5AyYm/EUFOkNpgSHOcU33b5Q8hRvw077PNi+eS8eQq4LCSCu/GwK
         v33g==
X-Forwarded-Encrypted: i=1; AJvYcCVq+GTT7VzUB+rMPJuNTf3ywmFEM63wY0aqAQ/jZ71jHnVCnf0P0Rz366+rEYvibR69Ws/YAkkCUmTXAyLmnJ/YpuQYGc/f8wsbnL0MgU3yUYanWXLA6ID94zGqXuUm8LPFQjMNsnxNjn4=
X-Gm-Message-State: AOJu0YxIVNfR8vgKsT3WI1fuObkk47VimYiSiGxY7KDst9uc7mh607EY
	NsKCF4mbLVersfcxzc5bBYVHbUm8C6g4IpsusqQRDdTKOY0Z0Uo6
X-Google-Smtp-Source: AGHT+IEptPCXhFypDb0TiKoR0+50iaXQ8iNL1eYyk0yq0qqdN0M3zxQ8yK6QDrCxBcJVRd6JyPIggg==
X-Received: by 2002:a05:6a00:189e:b0:6f4:3c65:d05a with SMTP id x30-20020a056a00189e00b006f43c65d05amr13559980pfh.30.1715084384195;
        Tue, 07 May 2024 05:19:44 -0700 (PDT)
Received: from mb-board ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id ei32-20020a056a0080e000b006f44e64dfe3sm7527879pfb.177.2024.05.07.05.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 05:19:43 -0700 (PDT)
Date: Tue, 7 May 2024 20:19:35 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, hadess@hadess.net,
	Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <ZjocV1nvWnxr_qUI@mb-board>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjmOUp725QTHrfcT@google.com>

Hi,

On Mon, May 06, 2024 at 07:13:38PM -0700, Dmitry Torokhov wrote:
> If we want to instantiate attributes from the driver please utilize
> dev_groups in respective driver structures to create and remove the
> attributes automatically.

Ack

Thanks,

Charles

