Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32EF477EF4
	for <lists+linux-input@lfdr.de>; Sun, 28 Jul 2019 12:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbfG1KBp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Jul 2019 06:01:45 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37363 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfG1KBo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Jul 2019 06:01:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id z28so1332424ljn.4;
        Sun, 28 Jul 2019 03:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sW/UYb8mObeW8WWhGrXYNtg6fROLodUuxps6PdiCevM=;
        b=GTd3qfwPiBY6r66aUOP7w5OkNRigCzsdeDxgx9QfHlvehm5O6Td0mfxff/fmNP3gCG
         IWypwFBS3KslLR1miL6Dq3R4ybg/gO90GTIplQA3R1YvT4FVsKXycLCztZTMFUgchFgb
         4FJFXvNy8Uc4Rdgreocq7tPzhjg3yhHt4FoPyh0LLV3G/pXeJYj1pnh++d85WOKWWije
         tiUtNog7KNOdIOvjE/DX/eITTKFUlp6E/xCHw90ZgIzapljFJAfwtiJkgC9u8rrrhfqj
         wGiVzLrCLT4nq1N27itnHdcjZZTEhJGLIIiUTedU0KmMzeUwiF7LsI/sHTdx0u8WmGcE
         DsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sW/UYb8mObeW8WWhGrXYNtg6fROLodUuxps6PdiCevM=;
        b=cv5ibSdHob5xsOu89tNf+0P+5vsfS2W+9xbVXcS2CpGHXNyaNAqjgA/bqgNBHiQhMD
         zdTajcFCdDwP9uM3LIedVwqnmaXTo7Pxj0Jp4nuQZ7ekgi9zDOZadOw353XnLTmCCe5Q
         OKiR5nEfyIela0ptKhVIAhzWV1Wz6KZsKrEElVK/BWNgI6sRjm7YGjaGvWe98Txi0w8D
         /AMiDZI+8ac0BGLX3QADNjVrbTZZMCI0Ly/CMSc+uL1B8x/oZxp1Rk8dbyPk95/6gcfd
         7M1EcdSuFOvlcmcUUhbNwPcqonWaPMtK12erOVuYZ9Fiac4hZlqOh5TwlgeXptDBH49l
         RYjQ==
X-Gm-Message-State: APjAAAUwVfsNlSAuL5ZoGf4JglRmjL94IR+aBvylvhc/0Z2+Jt9VCzPs
        D/K2gvi2zFpvnF9kD2ajp/s=
X-Google-Smtp-Source: APXvYqyrdGp0WCa8L6yrZWZpKTMqFaslqOKreZnL5V8NJs9iTBN2gRammQeJCxnnvhM9Od/n9pDiOQ==
X-Received: by 2002:a2e:8602:: with SMTP id a2mr51948647lji.206.1564308102149;
        Sun, 28 Jul 2019 03:01:42 -0700 (PDT)
Received: from localhost ([178.155.13.240])
        by smtp.gmail.com with ESMTPSA id u18sm9889983lfe.65.2019.07.28.03.01.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jul 2019 03:01:41 -0700 (PDT)
Date:   Sun, 28 Jul 2019 13:01:38 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v3 2/2] Input: soc_button_array - Add support for newer
 surface devices
Message-ID: <20190728100138.GC775@penguin>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-3-luzmaximilian@gmail.com>
 <20190727091443.GC795@penguin>
 <fb53b082-4d83-83a6-1ae6-b9fae9dc750f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb53b082-4d83-83a6-1ae6-b9fae9dc750f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 27, 2019 at 02:01:26PM +0200, Maximilian Luz wrote:
> On 7/27/19 11:14 AM, Dmitry Torokhov wrote:
> > On Sat, Jul 20, 2019 at 05:05:11PM +0200, Maximilian Luz wrote:
> > > -
> > > -	error = gpiod_count(dev, NULL);
> > > -	if (error < 0) {
> > > -		dev_dbg(dev, "no GPIO attached, ignoring...\n");
> > > -		return -ENODEV;
> > 
> > I do not think we need to move this into individual "check" functions.
> > It is needed in all cases so we should keep it here.
> > 
> > How about version below?
> 
> Makes sense, looks good to me!

OK, great, applied.

-- 
Dmitry
