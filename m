Return-Path: <linux-input+bounces-5105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7AF937E84
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 02:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C179282478
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 00:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCDD1C27;
	Sat, 20 Jul 2024 00:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JL0K0JyZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5A1C14;
	Sat, 20 Jul 2024 00:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721435383; cv=none; b=FY8WsyToSWy5pCgzb2cXJtMZ/mz4ffbm4v/6VZJhT+j8sQ2v2dqMlLTwgjDlGcnCAVx0i3K4kb15u9aKWEntcjPUAki1v30OMfFf4R+H3g3RSXReABxUE0NzgoRXLDKGM5D5RnNZuZverM0s8GIPL29XWeyk+cTb+1OrwYoJhZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721435383; c=relaxed/simple;
	bh=JZKaoN2R48aUplgzYNrJUY5WKGW0sOp78A8rRUoCPuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYl8htLAs22WhfhjIapRn5Lv9Wbp2BIzjJ1fZM2qZbMcaLfWGTY+5R381pYbY7jupZOYympsI2+LMyjfUfR2wMMmvsMnkVpSugeUk4T/22vTQGz+EMPKdI9UyK6hHxvOXaV5CmrhkN5T6NUUIQCNhjR6CiZPkSJr+UL0ama/k8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JL0K0JyZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc52394c92so21705695ad.1;
        Fri, 19 Jul 2024 17:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721435381; x=1722040181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+l14fB0m1Y3ZJneAxMH0hKYuL3D3s2mgWcMY5IoO04=;
        b=JL0K0JyZ47F9APT+PFbeasrFHiEd2QAfclvZbnqTcOmqQosEzAAp0zezPV0MjOxcHb
         jDMmJFX05AuLy/yvksTIU2ZO/hn2uSui2sGdMYcj0ZmbdKpphZx9Sy7maYzwQIDMKO4b
         ncjrcBdCo0POulZYplw+W2nzd4iwK1U33QnSK8aIY4uTGlP3YiaaRQu3kU/T1B288JEA
         klcgXqfKtlwwvaGbY9fsVJ8tq4UNRlox0KgULtkF7WFz9kyLSWeAKn4fWj/2DpsKM9v6
         TqiAPS8EZ66KLkpI9FDRTQkdNjxMmRXEWMmTSO5XDugkVesjgKCxJkCFvlF/5nAHFZPU
         ueJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721435381; x=1722040181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+l14fB0m1Y3ZJneAxMH0hKYuL3D3s2mgWcMY5IoO04=;
        b=HNhODYruejMpvKdjeO3oKtkhq4xYt+9KBwyw7MChRCBwEfB/fbEBahf4lLQVh++yI3
         /oer2NPiwvF8aX5G4KrSzHWeJY9OyQaPG8jzwNUNE73hHFvbeJbK9a7LY/hHoQHK8rID
         ZBL1zoHNZ7V/fF/oj/sGxtzZtqw0w7PGE9w6NFrs5gxnBU9Hv0vqRCiXGZpYnrc81RAP
         61iOsDzCTM561GU15YJRBNl7YsgNacvAkY2I9QjwuSQFf6obZqVJsWDS3QPZ6qp5cGEs
         1OAsdMo/Ey6HoMrPtgwPC68BHWZZPyuI+XQra1zP5n7TlbHzQZyZoXQHrtGX0cxJ4yoY
         ZZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDo4ut4H20mkOlBeeXh1mCxvIm0J4qCJ9NtU/POGEeqDEm+uGMS7lyECsi2Vp3elPSi4mxj69xnYkPxlzHXofAFvdLlDY+/E6+GhP3HApTNOH+TFAWwbq6uWUpDz66Gxa54Gk/v41O9rmy2mZhSKjTxCg3QDU+fgQ5YccW0s/3UKhmTaBS
X-Gm-Message-State: AOJu0YxLKprNToXnsYQtmYnZn9veqLBbmWgsNgnmMA0uIvQQ44P2sRhE
	Sj5wP/k17w8mb1/V43OR6CXI2gCjTZ3nDDd3ZmQhPpYhT5rA+ZNh
X-Google-Smtp-Source: AGHT+IGd8MAyO6JtXgeIWbJ2mNFj6RS3jM5FyZ/92MHZZ8C9ZdX8hTn18KJmRv8nSK5RINnneOYH3A==
X-Received: by 2002:a17:903:32cf:b0:1fc:327a:1f42 with SMTP id d9443c01a7336-1fd7453aaa6mr15656235ad.6.1721435380882;
        Fri, 19 Jul 2024 17:29:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1cb1:21f9:91f1:d0ad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f25b37bsm10819835ad.34.2024.07.19.17.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 17:29:40 -0700 (PDT)
Date: Fri, 19 Jul 2024 17:29:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] input: zinitix: Add touchkey support
Message-ID: <ZpsE8mQpahxBQRE-@google.com>
References: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
 <20240717-zinitix-tkey-v5-2-52ea4cd4bd50@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-zinitix-tkey-v5-2-52ea4cd4bd50@trvn.ru>

On Wed, Jul 17, 2024 at 06:55:34PM +0500, Nikita Travkin wrote:
> Zinitix touch controllers can use some of the sense lines for virtual
> keys (like those found on many phones). Add support for those keys.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Applied, thank you. However:

> -->  
> +	if (le16_to_cpu(touch_event.status) & BIT_ICON_EVENT) {
> +		error = zinitix_read_data(bt541->client, ZINITIX_ICON_STATUS_REG,
> +					  &icon_events, sizeof(icon_events));
> +		if (error) {
> +			dev_err(&client->dev, "Failed to read icon events\n");
> +			goto out;
> +		}

I wonder, would it make sense (and be more efficient) to issue a single
read of size sizeof(struct touch_event) + sizeof(icon_events) and the
parse the data based on touch_event.status?

Thanks.

-- 
Dmitry

