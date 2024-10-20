Return-Path: <linux-input+bounces-7565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D480D9A5260
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E5D1F21535
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD658462;
	Sun, 20 Oct 2024 04:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp1zZdbl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F479E1;
	Sun, 20 Oct 2024 04:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397957; cv=none; b=W6UCdi+BDAAaoqRbbna1zGuP9Tog40eh1xiUD2NybeRnxcIwpzSYHiy8+HLhBt2SSH+X8NGDXmnyPyqFA1y7JnG+Pne8A4cO33+VctXEtqzuuEU1UQfvzIXUe/JJ61X1iqbIs0Vo9Tzdfh/C8V60vxRC7Z9BL1lbNzYhDz0lYn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397957; c=relaxed/simple;
	bh=JAPjCbky3JM4Js30HaLIpXoOk/qpXtAc5ZgQZI0Nim4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUEuRGgbh7/yq6S6Sy9m5RrW7pKHOY0cWbKE/rTbJKjlz5DQHn6L2WdtTTT9DHCfQ48DpCiYAGH5P/lTBk+5DVvQPOwyeehqX0btaVM1aSVmCJk1yCDRj7CuZ8732mPxOnNApsxnfZdOS3F3j7Sds6KMehw/Kq43aTAhOJVnJjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp1zZdbl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ca1b6a80aso31081505ad.2;
        Sat, 19 Oct 2024 21:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397953; x=1730002753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdxAZPP8tKBd9xy8wdHQraowerxPEW9BPsKjH3hJ3d0=;
        b=Yp1zZdblv5bn0iTO9P67v8BtmS0aBtYycMmzi3v1iDsyp8QX8soAblqNntq3oIRmSs
         tLEhj8mS7A6KIoxheSaFk401ldnTwM2+xgQPWVDd+DTtymZ360Ps5GOOvMP35qaTQINt
         PB5Pa8qcz4RZnAaupGKm6SAZXPUHtnVhvZCSFloUX7Cxn/96SX1EDE2k8B0W/QL8I5pc
         hAxCkKhw7FMlMyItfbpJu7ePDJ5HvHfmUE8TOIBd1U4IRYVPu0HG6QUdNyqCQEyZxe/B
         62Pza656MWo55y2L2hQiBk22Bzgeudq76UtBPg5aKifSbBBbbmb8m0GzQnzkoJmgdrrZ
         eFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397953; x=1730002753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdxAZPP8tKBd9xy8wdHQraowerxPEW9BPsKjH3hJ3d0=;
        b=Hijs1ugPti4E3MkzFFsLX6Ws++GziyL20fLvihSLStzKDrxnqSv9Tn7BWoY/grgbel
         +KkI7huRdAWFA8hgNKV5dMb08+NDclVuHSCHiJEsJtXxqbqqXsaM+dLiACFDhXuiulfl
         4oSH8UyFS58xWegPlUodX2qDi0aQL5E8XW6vPa+6FcCN9b9mrR1eg2Gw0vIc0F+p4O23
         vSfZfWng1NkAJhLeXgnCC8u/9hlpRx3sLmYPuOKo21zzdRzI7pLGtPb6ngZmGtIcMx/A
         Py2Ez+bplxg+ORbr0jLO4X+DvzbiPrFA8ogjThZKVS0TKQy+okSXQBdOUVGYTT8HDGnq
         YHuA==
X-Forwarded-Encrypted: i=1; AJvYcCU9r4sAvOMChysURVBBJwKkvaiYNXxgG66Ql2KKRGJCiikCU1BCkv8RyXS4yHO0Ki7wDFVPZSg3bUrLudua@vger.kernel.org, AJvYcCUCxHasURNtT20ePvoOE9RRSIFeLDaJcn5y1ro+fc9gf5DZ603wCVoT/u5pRUF0I+zTd3jdNuC4sc+41g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZs6nFUJNaHmC+J5jtsMS9rai+D7Y3toA5rrgSvwymWsIVHvWb
	8fLlCl/B5zVAOkFjANr7KJrb5rECvzrYPUYQnTK79/F9iE5IHeKV
X-Google-Smtp-Source: AGHT+IHBIvWZ0uV1GR/m50ZQ4x/Hdm7GgkdXXrNd1kKqUe+bkuGv8vNm+r2H5ifXOrMUDosuFRD+2w==
X-Received: by 2002:a17:902:e811:b0:20e:55b0:35f2 with SMTP id d9443c01a7336-20e5a737077mr91778295ad.1.1729397953103;
        Sat, 19 Oct 2024 21:19:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab35f8dsm545377a12.31.2024.10.19.21.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:19:12 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:19:09 -0700
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
Subject: Re: [PATCH 07/10] Input: 88pm860x - use cleanup facility for
 device_node
Message-ID: <ZxSEvZK-1ydmUIxI@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:57PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code and error
> handling. This makes the code more robust by ensuring that the device
> node is always freed.
> 
> Drop the first assignment to 'pdev->dev.parent->of_node', as it was only
> a shortcut, and tie 'np' to its usage as a child node.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

