Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B596115EAC
	for <lists+linux-input@lfdr.de>; Sat,  7 Dec 2019 21:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLGUos (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Dec 2019 15:44:48 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37823 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfLGUos (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Dec 2019 15:44:48 -0500
Received: by mail-pf1-f193.google.com with SMTP id s18so5157048pfm.4;
        Sat, 07 Dec 2019 12:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xyf0SZecPpkfLjmlG+eMPlHT7I5Xhz/GSXg3wKF5298=;
        b=LakI9cilJttAR/DfAQxOuA91gI4/zJVihz/ge7MdhSp+JjysZd1Y8vBysj+LSibOpD
         3WZ4oruFthXPOpH0oFYnqk7iwJdSQF81TTAPiMZsIV4LU+NXyKzjE68pncawYSV/pIkI
         eoQmWdXF+DKHmO06RT22Ypskk6TDYaOQmISpS9l9NAsKyECoghlwbgwa/2YnMNCn0ctw
         lVghy0pbFXEZS6FL58SjN0705SO4C3IfseDo/etie2DmwoDzLGnuWKbXjRZtS46LonB/
         UmrDocvFDDhmAPIX77ijeP6l2q9HOTO2HkfoxphQz5NOWQ5L5pENduz6rE0s5D4IU6Vd
         PTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xyf0SZecPpkfLjmlG+eMPlHT7I5Xhz/GSXg3wKF5298=;
        b=etzUAA4fjgBi13NOHMlW5dSK85oOeDeCnLBGMRkyBPZ32B1VTvYiFMv9YfT2YEsKyu
         guboIoORrKd1BV228M7TPKUSi9Y5KQqIdVwDKsf5LS+BTD/bobx41al6HCTMjvqT3zCE
         YwcZyBXAXMWbGgOtSLzpPJujO3Wh8HgNTnGpkyqcf8S197moqtcuBIWAi2ZGiJtHrvsD
         2Q1LOwdKRpY9+vMcrU439o6dpOKNm8SGmgHF7aldzMloHHMvaUrG2SFAuR5dinM1EXII
         IfU3hPwKdbo/XtMwx78Yj5DYSaIgt9ufKkhxhi5GpIx2Q6PS4HG/1G2+9q5fJ8u901X3
         5z/A==
X-Gm-Message-State: APjAAAUNlv577pEFRD3ZvfgceOuiYlsbkO9kLo5ES4NhDXw7okYmsYrc
        pN4ClDKARoRiPL+BhWF1Ano=
X-Google-Smtp-Source: APXvYqx9jOthFQ3zKT9urFlJnFWqAP3oBNS+PKy6fXC71X8YS+7fEvHpDEQD9lpcr787AZVtYGYEUQ==
X-Received: by 2002:a65:5a4d:: with SMTP id z13mr10757516pgs.21.1575751487293;
        Sat, 07 Dec 2019 12:44:47 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id fh2sm7654327pjb.30.2019.12.07.12.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:44:46 -0800 (PST)
Date:   Sat, 7 Dec 2019 12:44:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        emamd001@umn.edu
Subject: Re: [PATCH] Input: Fix memory leak in psxpad_spi_probe
Message-ID: <20191207204444.GT50317@dtor-ws>
References: <20191121200115.24846-1-navid.emamdoost@gmail.com>
 <20191122190208.GA248138@dtor-ws>
 <20191126093434.GA1383178@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126093434.GA1383178@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 26, 2019 at 10:34:34AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 22, 2019 at 11:02:08AM -0800, Dmitry Torokhov wrote:
> > Hi Navid,
> > 
> > On Thu, Nov 21, 2019 at 02:01:11PM -0600, Navid Emamdoost wrote:
> > > In the implementation of psxpad_spi_probe() the allocated memory for
> > > pdev is leaked if psxpad_spi_init_ff() or input_register_polled_device()
> > > fail. The solution is using device managed allocation, like the one used
> > > for pad. Perform the allocation using
> > > devm_input_allocate_polled_device().
> > > 
> > > Fixes: 8be193c7b1f4 ("Input: add support for PlayStation 1/2 joypads connected via SPI")
> > > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > 
> > This is fixed in the current version of the driver, but you can send it
> > to stable@gerkernel.orf with my
> 
> Was it fixed by any specific patch, or just a side-affect of some other
> larger change?

It was fixed "by accident" when I converted the driver from using
input_polled_dev to  standard input device in polled mode.

Thanks.

-- 
Dmitry
