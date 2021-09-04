Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085AB400A12
	for <lists+linux-input@lfdr.de>; Sat,  4 Sep 2021 08:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhIDG3i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 02:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhIDG3i (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 02:29:38 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFA9C061575;
        Fri,  3 Sep 2021 23:28:37 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id e16so1209541pfc.6;
        Fri, 03 Sep 2021 23:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bl4NKpjT9hfH2LDjXGL9fc5jd4a6Okg/Vr9+SPMo/RQ=;
        b=T0UH4wj5AayxQ5Zy4eyT41wrfqnnInnq5zLfHD9Y6h63NXKNB3Y1G19vy/KSn5PR1M
         jy/OLXW9D6/v+IeQ4eMQRQA594llhbA4OX3tmuVhG/z1dvS+BD5FCz+sg+6oxBe2bhOo
         gF9RKXHNESkryZ3dFYjnMTza/gbwk1CIJ/vW5VcfE7rchQUoq210P3R9FqmH85urHGmn
         5ebBVyb1398L6k4RgpZojqxhmwiiEpr1ZpckmaOyDZIsYDL3v/duVBEakmQ4yyRCHOwJ
         zgPGRsM3ou9tAYwXN9ZK2y+1QqqU/WjPfOgluyT1Q/7ry+bIIn/sQCTTWSzZiuhLxk6n
         AYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bl4NKpjT9hfH2LDjXGL9fc5jd4a6Okg/Vr9+SPMo/RQ=;
        b=eW+sbr7tAE+0wBO3i5smID3XANn0YdVQvBPttNXlZKze2LYMG8vszYt0VqCdkEPl1C
         9pdQUA2QHPaEUxdy/yySr94ZfGJXoRNF40r1W/y/o9iip4VzaEhNFBmQmMBvnT2OcTBM
         zNdUCT23AgV3EuOWL8aKlBVKi3vbOijpYXmwjGResUIAsAHeXkG4eUjNF+/vwcEvhpPQ
         qqXw9Vn7ghKj1D8AE/FjSdN5fSzo8xhqy6iUSLBPZocKhiz3Jek+6Asi9bzSCz3PmTBS
         HMXwCnljHlg29NEbHV0aoS0TdLFwH8g1RhRE7szTf/5xv0F7T6F2NbHDfPwLx1X6rtne
         O3ig==
X-Gm-Message-State: AOAM533QCYp5JWHEZhxQRRuVkieG/W6Et4/Gy2tDZUqvi9IxPqD19Kwe
        /OygApmWUB9YzRLb3n5ie00g+7Ca8yQ=
X-Google-Smtp-Source: ABdhPJyezLJEJ7TMWglBRUkJvKhgJeqLtY2fsmEy95PPs1rY2naWHl1PEpgOCkyEOe4M+L2QFVbpQw==
X-Received: by 2002:a62:b610:0:b0:3ff:c3ae:439c with SMTP id j16-20020a62b610000000b003ffc3ae439cmr2281016pff.53.1630736916653;
        Fri, 03 Sep 2021 23:28:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:44a5:4d4e:ed46:daa])
        by smtp.gmail.com with ESMTPSA id g4sm1070808pjt.56.2021.09.03.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 23:28:35 -0700 (PDT)
Date:   Fri, 3 Sep 2021 23:28:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] Input: adc-keys - drop bogus __refdata annotation
Message-ID: <YTMSES4Rez808cDH@google.com>
References: <7091e8213602be64826fd689a7337246d218f3b1.1626255421.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7091e8213602be64826fd689a7337246d218f3b1.1626255421.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 14, 2021 at 11:38:33AM +0200, Geert Uytterhoeven wrote:
> As the ADC ladder input driver does not have any code or data located in
> initmem, there is no need to annotate the adc_keys_driver structure with
> __refdata.  Drop the annotation, to avoid suppressing future section
> warnings.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
