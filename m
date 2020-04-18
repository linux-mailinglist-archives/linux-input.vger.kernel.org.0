Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2D81AEDBC
	for <lists+linux-input@lfdr.de>; Sat, 18 Apr 2020 16:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgDRN7x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Apr 2020 09:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgDRN7x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Apr 2020 09:59:53 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750BCC061A0C;
        Sat, 18 Apr 2020 06:59:51 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id r17so4122372lff.2;
        Sat, 18 Apr 2020 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JwkmxVU9G3R9bLQG5P17Fl62C7R0noZkjryh1/vwdL4=;
        b=H2vZ4H7F/2SDq1uSiVUMpbk84rKvJBQWfuAD3TaJYN+qqBAbcaTpynx+2xK8oq+ZMY
         1Tjt777floOIngeH0FCfftXYS04UdgCNVd6rZWo6kXhW8ol/SrxIFCPOD5Yow1VuwdIk
         NWsCmE7OrnKCGtjY83O+j4Q9Lm+kUXJOnsVOVZAhhIdA8E19u3pqc/kycnmwETKpjZqU
         eH8ZlOQYfp6x+DoaDcuJzYVw8oQEL1yWTo4X1y3QDhwdrB52wvod3F3nX0GJb5geqhJO
         CWvFD89Mu3RvXRGR1hK55iWZG/vTHfRJvX5O5K5jS+7mUhwZ/jM7h+p4d7rt4JVC0fFC
         /QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JwkmxVU9G3R9bLQG5P17Fl62C7R0noZkjryh1/vwdL4=;
        b=MajkOGakveUkjbcVUvS/Nx2Y7Oha6MXnpKm8A6mGbvmttFZytg9r2lzPmwJRWtvh9a
         GLlLeURSkRr8z8C9vcCjcm+b3KJ7CQJI+54MLAhtGQJzaXvpadMvJ54OAsk0ua5nWA8I
         yWcZcDNa4nMLiDM2oidM2t6VMrU45Xgu/ZsFNBfsa8YanoJO2HvcESVnPfXnNwF4KZ4Y
         sU+GQ7VjIX5XaxcvEreJQQLX7w7S20FIY6d3NxDIZHkxRrp9eQ9oDXtHLr0deyy1srf4
         0I6hyk4vFjs4V8HxXQFIstbnyGyFMYqX/kQcyUHjmJWeqSULNV7W65kUZtH15hySayqM
         WYHA==
X-Gm-Message-State: AGi0PuYQTqTBs2P+OV/C7AEHkksFprJIRodZS6IjK6hi6Bk0b0rXxIAM
        dKaLtd1p3Xw7dJRQRyan1pA=
X-Google-Smtp-Source: APiQypLNyHnQhiiDKDwvlH27vs0wbJdm6L5kOFttERej08ep+e5PcMo57aDtfF0AtnDOyXObx3wlcQ==
X-Received: by 2002:ac2:5dd7:: with SMTP id x23mr5169760lfq.48.1587218389858;
        Sat, 18 Apr 2020 06:59:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k2sm6050947ljg.7.2020.04.18.06.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 06:59:47 -0700 (PDT)
Subject: Re: [PATCH v10 31/55] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-32-jiada_wang@mentor.com>
 <46e0b0cf-63f1-4b46-dc3e-0e6610e72d75@gmail.com>
 <75f81c9a-e5ca-1382-43c9-8fd4acc36510@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <68267a10-9e3a-37a6-b3fe-9a1bf9f5916c@gmail.com>
Date:   Sat, 18 Apr 2020 16:59:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <75f81c9a-e5ca-1382-43c9-8fd4acc36510@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

15.04.2020 17:44, Wang, Jiada пишет:
..
> thanks, I think your solution makes more sense,
> I will replace with your suggested solution in next version

Please feel free to CC me on the next version.
