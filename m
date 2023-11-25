Return-Path: <linux-input+bounces-236-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693C7F8855
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 05:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288081C20B9F
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 04:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDD2ECA;
	Sat, 25 Nov 2023 04:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m998r/w5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA5D10FB;
	Fri, 24 Nov 2023 20:45:32 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c194b111d6so1792003a12.0;
        Fri, 24 Nov 2023 20:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700887532; x=1701492332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLYARbPomSl/uJGWsvEa59hDCCv752oywOGu0kXKEgI=;
        b=m998r/w53Ee0b1TbPST4ZIXusD70rwF/WK+MfRxUDqVllRvEC1DNO6/l15xWBfE9nC
         FAtbRJRfIO13YoYVS2YNFlaFT/UJIpQk99mqL209PBgAD0SODRjE/ii9wt8HC2wihlqa
         x23wTOKdim41A4NM/Y1rILOPaq4FC3MpIiaUw5OMZ7sX5m4zoEyPZJ8cIKP9252u9cZq
         L2qlxOiKx6NpKoOrjAT5APMXNKKm77iFY4Aq2TvctrRgZRqX/NJdJ5lmxnIJFYjx3VFP
         a6Keyn1J+FNvKBP10xa8vsdqZg+lIt2LfSs5RCq/+31+YlFq1PDAtUEiNq61ftYKUeID
         4RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700887532; x=1701492332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLYARbPomSl/uJGWsvEa59hDCCv752oywOGu0kXKEgI=;
        b=j+KRr8pOid8WSwxdz/CDalYSTHZrb/lT6nJH8Fa/eZ1DTj2yjIKDpte4MLkJGltWOM
         yzljSaEnDRW3S2nEKJ3mQ/R4b7NAk8xmuxXCk7Jd/GzwQ9Ax54/45XCj/XIOv1kNjt+W
         T8bMcmiD+nVgFJEYQQQmOVZyuE+m2U/0LhHGHLPINxyC/JkKhhCjWkY6a0VFO0lr33SJ
         7UTA016zkxUPN8nBCCcTid1AQsh3HRiPDK/JDP2ZUuegYfqwhn9hK60KkDoQBQ6cuNzl
         v+ib5a7lEul4roG6Q7jYcs8w3ELO7IbCyZbRlSmXDUUxGuZYyOEWqyQIbGU19G+pmzmS
         BDhw==
X-Gm-Message-State: AOJu0YxG4tG4bmeKU/nLlveortSgzqV5pmigew+qCEtzL5jjSCi4yPIW
	Wb8iXlidja2KZdLAB3qPiiU=
X-Google-Smtp-Source: AGHT+IFP3hAARytO6ajR+MptDD0dRhR5Cea9zwCijFUptDJEeg/yNOukSGn6KW8Ei03IWDiyrG7cCg==
X-Received: by 2002:a17:902:c40d:b0:1ce:33b2:a1e0 with SMTP id k13-20020a170902c40d00b001ce33b2a1e0mr6976140plk.33.1700887531598;
        Fri, 24 Nov 2023 20:45:31 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:8b5c:82d0:578f:d0])
        by smtp.gmail.com with ESMTPSA id x16-20020a170902ec9000b001cfb41589ddsm391726plg.293.2023.11.24.20.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 20:45:31 -0800 (PST)
Date: Fri, 24 Nov 2023 20:45:28 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@chromium.org>
Cc: linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Takashi Iwai <tiwai@suse.de>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add quirk for Lenovo ThinkPad T14 Gen 1
Message-ID: <ZWF76ALANQwP_9b1@google.com>
References: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>

Hi Jonathan,

On Mon, Sep 25, 2023 at 04:33:20PM -0500, Jonathan Denose wrote:
> The ThinkPad T14 Gen 1 touchpad works fine except that clicking
> and dragging by tapping the touchpad or depressing the touchpad
> do not work. Disabling PNP for controller setting discovery enables
> click and drag without negatively impacting other touchpad features.

I would like to understand more on how enabling PnP discovery for i8042
affects the touchpad. Do you see it using different interrupt or IO
ports? What protocol does the touchpad use with/without PnP? If the
protocol is the same, do you see difference in the ranges (pressure,
etc) reported by the device?

Thanks.

-- 
Dmitry

