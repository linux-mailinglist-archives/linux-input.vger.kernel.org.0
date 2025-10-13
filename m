Return-Path: <linux-input+bounces-15424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 93094BD5167
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 18:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E68434C393
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F93268C42;
	Mon, 13 Oct 2025 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUiGKMj0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543E9280037
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373313; cv=none; b=Gd2fGg0RwAFfTGkCQiNkUdxevJsyh5Js1cI1v7bwV3Ke1jY+FTAIWX3EWSxr60e0+yAQLNSnxsem/9dMdBpAaC2kFz6VO/MCCObHVsJv4MERl8frlNghrzhnaCXEyRCY9z/eA4R+g0I3u4AYzzP7w7a7dexIzAnRv7zupWVBacU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373313; c=relaxed/simple;
	bh=+cYO9F+BBGqM2L7Qmc5LzRmTRFnLknC/E7j3QJzFclE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmVQzaOcF/jo/VqDZPkEhYqBRLgSh4zPwODiFnnuwOdxaAspfBbLP9qc3KXKt/toWeVh/ab5F2w/ZQ1SV5hPB3oDdUerOKOsp6jRrO/YppRW5K+2cd75VYDYRF613CQuIAOGv6xKmbQC8LAK90mWecNyQnEEzVMGYVvoM9HTExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUiGKMj0; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so5700742a91.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760373311; x=1760978111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gViHWXBMsp9Ox/uTXGivgkxef5vck7upcLtn4B8aPC0=;
        b=fUiGKMj0/9F3pWKybWDCmBqw/uryPoO5BPnUCH41zgCLshasCoaq2SB2XXZMu9t6ib
         yr3SRyrZJqG7yVdulxIqhPXW9jihFARKQPck+1Hh2ovxEZb1QKyKgyLmxT0Oh7PPMLMV
         AOUhk2zn6TxTYIug3adAXCYrLu89CoTqz6uZtXeTqWttsk98QOfS8cSLJnCJbkFJJ89S
         WPrdtetfa5yx0rdF9/OE0JUUOjmDgsGlafPty4ED+MTvPLanyY1Zq5RxLBjPcr867+LM
         5PKTt+VnqTFcHkkQj8wlK6Fecz7x0qOFjm/X3819wy2fXYmNr/iycKsK61rnhkvH42HB
         2FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760373311; x=1760978111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gViHWXBMsp9Ox/uTXGivgkxef5vck7upcLtn4B8aPC0=;
        b=wLBn6mWGgwVcypnm2Qf/Evs9UlZkl6zxKjjrqNkgm+pIOkV6U3EOq0/s3JKnESu9vW
         NbVAQeX8khPDGiKJeOvxc8TAOigQzTCqs+umCOWV2Pl3yzwQyII9ytPJtcRnZ9RAH0NX
         bBmfgAM2lL+1wBV1a9/J6n/g7Udzs18LCzwj4TjnFRqA6CGTZKns/4/pfg9h/e4JoKzP
         SmFa/j6whotOEggkEwRAw/0sS77OrmAy+c6sSTvMnla8wsybzZXOMheI6mPQBQ308pv6
         XuhLhELsXdv4XN57oDt0UaYW9hc54CeGvTFMqZfeWRe05pYJjqHvPrQADLYoO+7XRE8Y
         3heA==
X-Forwarded-Encrypted: i=1; AJvYcCXh4Nm2vLamU8FWmlok1/ITfWCQrPzS1YE2c6+wnuyiLKxe4t/ncYsqR1O+v+qo/1n2e/oWMR5tQlJh8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YybeFqEYbrrHMDhSevibduB/Nt19+klT0wZnxhvQO3TA7wNMAJj
	w9e2s/4iT91Pv8j36rxUkiTRtZKRvwFMkDxVfoJLylqZNDyYRZP8nhGiNXPhfQ==
X-Gm-Gg: ASbGncvmeC23z28FZ9kpjdDBFsEneMoN6WEKTmtMEFe3c/hjqH8yT2AjXd6qzLTHYbJ
	Bth27wiOr9jpQK/2h3k/zzUxlHhoH8tD5ZPBIrR9GQ59l1OzreyXvfhQLLdlvhqkVSGSCasE1Km
	pdDbDMg6eEuE7C9wRowm9VsBqfFpeRnRVYfd+33Cz8WGtOAX2gyygTVTW8GFFIXm9ODFyugfTr6
	Yfcv1tWxB1z+35DOfMNJkuDjmTNpzQ1Dr+hxxjsbLTDKVNfVzTaKyhb44Bi9zNQXmtQR/OExSkI
	wJJavgiSoiZPitlUDcF+Aw+QPOz+IvUs4heNIZ9lKczU2N/3fiMXL6xHBcPLZc8sJZ5/eI5PzNZ
	dgkl1CGS3muHOFYamYI+l5piMpohhwWqZf6V3OjMJffvXDddQL6lgn6ORe6vvDd/BA4g708ex+h
	jMXJtEiIQTPpJ+/qU2
X-Google-Smtp-Source: AGHT+IGFP/fF6YnGv6Nk6A8q6vU7tu1gcffETQGoKEaFIuhqMBs5IMDspTmqa0wmGgj2LUKVaKB38A==
X-Received: by 2002:a17:90b:1b04:b0:32b:cb05:849a with SMTP id 98e67ed59e1d1-33b513861cdmr28406055a91.29.1760373311440;
        Mon, 13 Oct 2025 09:35:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2811:1686:ffe6:64d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b0ed20sm12996232a91.23.2025.10.13.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:35:11 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:35:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, Weikang Guo <guoweikang.kernel@gmail.com>
Subject: Re: [PATCH resend] Input: goodix - add support for ACPI ID GDIX1003
Message-ID: <kuxyyl2lw7iublotoouoj45zwdlmeetqldudbye3mmi53etusq@diwl4v442bf5>
References: <20251013121022.44333-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013121022.44333-1-hansg@kernel.org>

On Mon, Oct 13, 2025 at 02:10:22PM +0200, Hans de Goede wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> Some newer devices use an ACPI hardware ID of GDIX1003 for their Goodix
> touchscreen controller, instead of GDIX1001 / GDIX1002. Add GDIX1003
> to the goodix_acpi_match[] table.
> 
> Reported-by: Weikang Guo <guoweikang.kernel@gmail.com>
> Closes: https://lore.kernel.org/linux-input/20250225024409.1467040-1-guoweikang.kernel@gmail.com/
> Tested-by: Weikang Guo <guoweikang.kernel@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry

