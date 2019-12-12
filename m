Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 285F311D703
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 20:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbfLLTYY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 14:24:24 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36310 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730565AbfLLTYY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 14:24:24 -0500
Received: by mail-pl1-f194.google.com with SMTP id d15so1066311pll.3;
        Thu, 12 Dec 2019 11:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Sy3kpI5FGxODnxp+NhgOIrQABn0e6kkUyw8Gg1M4Dik=;
        b=OPExE5jzxdtGGQZz+7B/cs5g4wOwsMkG847ZPlrYmrJJHD1E9uR+HE2c3GSbxdaIY9
         wnlUF0t+l/3RIQpAxFQA3yRwIffKOZ54y3bps3Vw7/90mA3k05/FIRGKa2BdkP6FFD/q
         O2hnLj2xxpSUTZ3TMuZDxgKU24rJzUYWk3cxruX3YSYVIwGqzIgPq4DTMeNTOGS9IMU1
         zsaRkclgzvrY1ftKj4tfQyWDIZIsgxecZskhwgm1cHo58o1S7xksKd6UQ1vdfJDu5+hn
         aFHN6Na8mbeQOtDQgosWtnWct/F2sp5Vq9hUQLC8/y3MeNsUEw7OpZ81p7sQa00wntla
         iEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Sy3kpI5FGxODnxp+NhgOIrQABn0e6kkUyw8Gg1M4Dik=;
        b=aEQZV30pglzldZMrIRO2q4zv28GgAn5TO7Ogm4d3N6hWnWwuOjCYRTVuSN/YVve67x
         TshnUNy+db/YhJzGi7CBA7hB4/Io31xdT+okcr6cg5TV/cKTwEAeUOiYxYKkBgHKwv3H
         i9i3GZ6boC1IVfct/2tf0t1wyE5Q7j7/ZxH/9JGztxZLH1qTg7wryRhcEUBcpnXwg+6o
         UA6dkpDBgTfMsdI7vV29q2HUR5087UNPYpfjiQJ2xbxY7AxB+rDlIh+FCGJvAu8OlfQC
         uh+BLJZl2kLDHMwcmHe7jEtFBn6gi6JwrEUf74msPwsO4Oj1oMEp3g+Kcadv1nr4p/cj
         0fiA==
X-Gm-Message-State: APjAAAUixsUfyfrT6hMagpvCIV0bfUkxZdgEqFUrqPxnu4153EtKEzGZ
        CH96LW6qdrDgMqH8RQD16xQ=
X-Google-Smtp-Source: APXvYqyrk6UNlRkrpi/iiAiNNgfx0iFcIOLLT5vCbcx0FrLX9dpJQPGjK4bP+tdHZ0M9dExuBes/hw==
X-Received: by 2002:a17:90a:3586:: with SMTP id r6mr11625141pjb.36.1576178663486;
        Thu, 12 Dec 2019 11:24:23 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j21sm8088024pfe.175.2019.12.12.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:24:23 -0800 (PST)
Date:   Thu, 12 Dec 2019 11:24:20 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Scott Liu <scott.liu@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>
Subject: Re: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
Message-ID: <20191212192420.GD101194@dtor-ws>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 11, 2019 at 05:03:18PM +0100, Michał Mirosław wrote:
> This series cleans up the driver a bit and implements changes needed to
> support EKTF3624-based touchscreen used in eg. Asus TF300T tablet. 

Johnny, could you please take a look at this patch series?

Thanks!

> 
> ---
> v2: extended with Dmitry's patches (replaced v1 patches 3 and 4)
> 
> Dmitry Osipenko (3):
>   input: elants: support 0x66 reply opcode for reporting touches
>   dt-bindings: input: elants-i2c: Document common touchscreen properties
>   dt-bindings: input: elants-i2c: Document eKTF3624
> 
> Michał Mirosław (6):
>   input: elants: document some registers and values
>   input: elants: support old touch report format
>   input: elants: remove unused axes
>   input: elants: override touchscreen info with DT properties
>   input: elants: refactor elants_i2c_execute_command()
>   input: elants: read touchscreen size for EKTF3624
> 
>  .../devicetree/bindings/input/elants_i2c.txt  |   6 +-
>  drivers/input/touchscreen/elants_i2c.c        | 358 ++++++++++++------
>  2 files changed, 239 insertions(+), 125 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
Dmitry
