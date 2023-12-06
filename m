Return-Path: <linux-input+bounces-546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D622E806CA6
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 11:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76904B20B7F
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 10:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC30530355;
	Wed,  6 Dec 2023 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BoYWAcwd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4E01BF
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 02:50:22 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c09b021daso41142155e9.0
        for <linux-input@vger.kernel.org>; Wed, 06 Dec 2023 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701859820; x=1702464620; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJYAfQ+YUrTFCjhKIcXnZ5V74qAaajTAXhzR6iP/u5A=;
        b=BoYWAcwdQk1b2K5QvJ5pt8aZOmiE8nN4oZm3tG0csnB1jWxVtI9N30Vu+ZzdxeyXSN
         FoiX6rS11QX7K+X/VglM2boe8V4Q1WzYCw0YebCQY29occF8CJRaQdgE3mWhIFA3llBL
         axVqwZLe0lWGCIZJysx+VlNpq4/l6UiYLveM6D6Pcesoy1441mGAKFFeps0rdVAYVJHx
         po6qHGsM/mAwR55vkKO0pAuvnw+BNHzJa3s3O6InM2VX8XknvF6ELvftlsFSvMrvomF7
         r/r2HzpKRckwvc/cd/Q8jmpLpgBsQ0mOkTH09eaX78YrhiviTZ3ex2dGTEwaoS5S6bVE
         N6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701859820; x=1702464620;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJYAfQ+YUrTFCjhKIcXnZ5V74qAaajTAXhzR6iP/u5A=;
        b=Gr4b39gLKDfPJ6rud1Ar8oAYB6oJD93HwLQUUdwimoJYOMDGoLV3KMHdBvwLu30v26
         nE9WkdFLN6mmanb+zxEAZEvdhlgcWb88wCCnQoJJdhzZUJ6t92Z485fcT+VwetM39gi+
         6d1T043kh98DyWaxv06m3OMCeN9OekEXVZUs0uG85p3hVYENOGNv3op6R/T9oMT9bnzE
         usDNrssK3sWBgCRlVl50cOWVLrQFtDhXblykjoN6xfZ5E2eSptREQAhvVcQ5xUaoDl44
         bKGa85t7U2gZSmvE5bgcpdbb09iXgf3p22hahU+o+viiI6HRXjMV97t5hxsS4P5dcw1M
         s7dg==
X-Gm-Message-State: AOJu0YzUb7fvONi7gBAOHU49DHgGITbgU4PQwsHvTTsBkPqSgAhYdgGX
	Q4qo5ScBQRgK8HLVo5DfwxwdXQ==
X-Google-Smtp-Source: AGHT+IFYBlGUHbf/6bzwT6s9eP0xNobqy4AQ0bWDawQXVriMNGtXEQQXZFeDZ6Syql+pK6RklpkD5Q==
X-Received: by 2002:a05:600c:ac5:b0:40b:5e4a:40a2 with SMTP id c5-20020a05600c0ac500b0040b5e4a40a2mr484698wmr.194.1701859820679;
        Wed, 06 Dec 2023 02:50:20 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d420a000000b003333541a5bdsm12511031wrq.80.2023.12.06.02.50.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:50:20 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 6 Dec 2023 11:50:21 +0100 (CET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Douglas Anderson <dianders@chromium.org>, Julian Sax <jsbc@gmx.de>, 
    ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>, 
    Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com, 
    Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>, 
    Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 0/7] HID: i2c-hid: Rework wait for reset to match
 Windows
In-Reply-To: <20231202224615.24818-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2312061149040.29220@cbobk.fhfr.pm>
References: <20231202224615.24818-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Dec 2023, Hans de Goede wrote:

> Here is v3 of my i2c-hid series reworking how the i2c-hid-core waits
> for reset to complete.

I've agree that it's worth proceeding with this series even despite it not 
fixing the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET completely for good.

Now in hid.git#for-6.8/i2c-hid.

Thanks,

-- 
Jiri Kosina
SUSE Labs


