Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19F83B36A
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 12:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389509AbfFJKnO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 06:43:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40764 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389426AbfFJKnO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 06:43:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so19624wmj.5;
        Mon, 10 Jun 2019 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4X5BVYduqqhkfrUdD8uPwIHjHoHTW0DOqj7pcTji4ds=;
        b=MmjeWb38tYAVr0X4P+VQMcjoxY7H4NRBgapwwg5TO1ubz44Vwgk+rfoKSOPceAvsjj
         sEBzyNi2ee6CUA7BRaxtnXUoEF+NswhINA2W23ijkjEmguFhsq9qbmmEm6DiD1o+Rxa9
         a1UyF6Qaudbf9pgRavTSJCt+sLKesrSEZdkQeSYgAsBy0UJ3g9dsaUrmv2VCGIpoasGs
         12PEmha9SSAfPr2pc7n+v0qPWly+BBg1F7ohYii7NJ+Pi3ANHmzZ9FxwdkyZ1+RHIHGU
         Tch8A7J5TUxdHFeLd31NCDSqMCjdqyW9LwD1NRcZG+8IlB3ttbgtT5o+oZ1HOUZ+2qsE
         bS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4X5BVYduqqhkfrUdD8uPwIHjHoHTW0DOqj7pcTji4ds=;
        b=OhKcHjtjqylfpSYP18djmZlEmOdfX8QQWab7vYAGJJBKcejdSyMvfYIWiRsviunIe5
         D3vM1WWAKlm66A6yCFEGK19p6jujNs1bN5BAH7w6LNx+gO3l2ex6uE5PZogvFCiMvhLO
         IrzFGAQrUuYwPF+P6ZkW8rKCqK/shdWKF8cgXyVXq8v6hKgaxzws3FXzxvukDKl8wb9b
         WVSJAs3qm2uutI+gnYFmFLSJ72Guc2i+uot6EqATPO0m8+DDby2F+nRLC4ytIw0dXkTr
         kmcP+kEgRzoKlaW7ZUQ8uEqfjanM0MIex5T8zWUAcIPUeP5rayFprlp0xgEFhngJrzEo
         PBMA==
X-Gm-Message-State: APjAAAXBiOrApZlhHS6qdGV0cmkwqyRzv8mGBVp8/upoEkGa/6hjxQfb
        JLxIvq61V+50IA3PEhegxbCxcEjXLJg=
X-Google-Smtp-Source: APXvYqxE2lcrbWL6CzVWGM91R+jiI+w/lbi80NOpyRVk5mPpNOrcPvlp/G7MVx/7dJ8gmGNA7HXAjg==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr12880619wmb.152.1560163392455;
        Mon, 10 Jun 2019 03:43:12 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id x6sm10097421wrr.11.2019.06.10.03.43.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 03:43:11 -0700 (PDT)
Date:   Mon, 10 Jun 2019 12:43:10 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
Cc:     XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "hui.wang@canonical.com" <hui.wang@canonical.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRD?= =?utf-8?Q?H?=
 =?utf-8?Q?=5D?= input: alps-fix the issue alps cs19 trackstick do not work.
Message-ID: <20190610104310.qa5snt7jpcljodfv@pali>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Monday 10 June 2019 10:03:51 Xiaoxiao Liu wrote:
> Hi Pali,

Hi!

> We register our CS19 device as ALPS_ONLY_TRACKSTICK device.
> And let the V8 protocol function support the process of ALPS_ONLY_TRACKSTICK device. 
> 
> I want to confirm if this solution OK?

Yes, it is fine. Just make sure that touchapad input device is not
registered when this ALPS_ONLY_TRACKSTICK flag is set. So userspace
would not see any fake/unavailable touchpad input device.

> Xiaoxiao.Liu

-- 
Pali Rohár
pali.rohar@gmail.com
