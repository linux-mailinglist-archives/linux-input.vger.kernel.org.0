Return-Path: <linux-input+bounces-7631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6D9AB817
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 22:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE24E1C21011
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 20:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C72C1CCB4B;
	Tue, 22 Oct 2024 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0+tW1at"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DEF1BDA80;
	Tue, 22 Oct 2024 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630754; cv=none; b=CVxzIls4TSKQqSbw3KvOW/ot8RWlOhPPN3xfOQlHYbhRunq6qgiFidMPk5XLLmbAPSqx704Tbt13PHYial6dS3aeJkcpLvu9KLi4NjgsQl5kZRKvkQGE36FUPzNbAh6Fu66ypqrEqvUftddbiIDKLvRarz5esLnUf370hImhf6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630754; c=relaxed/simple;
	bh=hYznU99Gz6lDB78306nnP2N0S1YYbOsW3FeJCrSQz88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs7lz+P52l6C7Vo2PtsMKRn7orPNNYLHlJv42MXwuuk1Llrzyhx70jo85O/PdX7h/hQNpnKQvrLDQbMEtzAYmZabjbwOxJ7tWouHOtgMyQPx8f8kelWHiRJMMPCEwQGBZYcPRqxT8UhV4AY1hJ1mi0E6D9WdbfPB13I8IFN/JH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0+tW1at; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-208cf673b8dso59501035ad.3;
        Tue, 22 Oct 2024 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729630752; x=1730235552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGcVubgeABd0/PmmPiE/7qXUdJE2sMJ6ZOzH8qpp0iI=;
        b=h0+tW1atFExNN3sR68L63uvwl0EaIshwGAjzVxcTusVBbxI+vRHWA3fdAj6JaXJrRE
         g1FCSAy6hIkRwAwFtidPBfcAu2OsX/Of+auSalMKCYtDUsR5S6uJZ2Rrvd2OX584Q8Zq
         rIVk/kb2xTfwxshHWSh/+2Ef26xUu4MhnTnELYjP8iCOs0cwIvbxNyrqcDj/ykbknOe+
         lMRROY4GAVE851aeDb4k3vE9kzjfKsGPRw/embkqIjthaciTFnPuvfUoLk2/FXJowwe7
         ov83Tx37c8px6rO+0GBScc39ExPsUJwhBwou/QicHw/uMHNURD3GGiUnIL2woQ8WGwlc
         GCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630752; x=1730235552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGcVubgeABd0/PmmPiE/7qXUdJE2sMJ6ZOzH8qpp0iI=;
        b=otPH7IxU0bM+NzWp/++R9jeatnUJq/HnexrZHpqhZjVtK9ezPY5Zr1NnAu8FAIECtU
         QshVLsc1THXpIey4Us9ld+/ADVxSFymtOf5xT85Q5841LZ3A8apGvDQzQ3xQoES0Ad0o
         PyHoqQ9f0oG+6DbOAX1xKRmfBO4ooZLn+nr+tohkwpNjJuy0TaBMHlhq6Z+mdEInOTiV
         l5ClmtmOkgrATJ2MctNUz3dUKp6gRjB/UoHvfYkPIVvy/t/V/fop4tVD7YIAzu1Yl9CZ
         t87yJxoZIYaQVUbOJ7dzvYOTh+6W9PUy5yw6JJdeFGnnendLZr46QP8mlklNVH6UTv7Q
         lKmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPxY1818/vBsY5gZ6ZYi3jAmHdZuIWMigk4DTqFjxJ7wiQBrUGtM73ldHYShvLAOw5RXk+oHxGo4ved1ax@vger.kernel.org, AJvYcCXWmjt2qmPW7tb05dlC5Ru3b3+yfjnIL9D0nZ/CdaAySaLZDE5H2rjcyNBwDxULj+VMFcjamkI4DK8tIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4lLb7Dk/1eD98fWPxDlU3NJEoxOjoFtkNnG7wXPopXCmXP6Gk
	qVW9ILVJC7MhDk1ffkqdc1yis0r1ZTbOgtrdGChtTEKpYCHRyBh+
X-Google-Smtp-Source: AGHT+IGJNU/cLwbWsuoQCsE3dJTP2JypH6Hr2f1MS7P2CbI5aJ0sG6TzIyW1dqVhAweQ4wLOdWoaaQ==
X-Received: by 2002:a17:903:2312:b0:20c:ceb4:aa7f with SMTP id d9443c01a7336-20fa9e298c1mr6239915ad.11.1729630750519;
        Tue, 22 Oct 2024 13:59:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:94ec:f4e5:1552:e2cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0c0e2dsm46581055ad.123.2024.10.22.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:59:10 -0700 (PDT)
Date: Tue, 22 Oct 2024 13:59:07 -0700
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
Subject: Re: [PATCH v3 0/2] input: automate of_node_put() calls for
 device_node
Message-ID: <ZxgSG55LUbw08mp8@google.com>
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>

On Mon, Oct 21, 2024 at 10:28:22PM +0200, Javier Carrasco wrote:
> The first patch of the series provides device managed memory, which
> simplifies bbc_bee_probe() and removes the need for the goto
> instructions That also prepares the function for the second patch where
> the cleanup attribute is used for 'dp'.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied the series, thank you.

-- 
Dmitry

