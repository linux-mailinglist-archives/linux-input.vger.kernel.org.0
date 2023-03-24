Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6066C7517
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 02:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjCXBdp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 21:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjCXBdn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 21:33:43 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F42112B9E9
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:33:19 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id u10so520478plz.7
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679621599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOlZ3QEqLCNgmFMKt9Te3xOjoUcpEZV1QZWm040e01Q=;
        b=h8Bc4vPzS60U2XcfTImMKYXZiyM/+J+jHikwPcB169E4wm1zc3eHD+aCg0uXUAKoO2
         aXpERVPrDfegkQdyFy/Z8m6yY1BAHA5oVVF8ETx34hEYbwH3fPvQfsA7oI7k22Rffxog
         AHs+8CEXmVoohWLzdj4ldlYPW2j0bgit4gexzfGF/BUrwSrDIavnSkZirxSzdkxRxeWS
         IdwDzctqXcBA2YPxSqKgkfU+rGYhjg86aYwJXNXpc9Q/i2y4OEbNqI/mQVKZ8MKajSYv
         7vBLo1T/M8ziyhSVf8WSIbGZwDLPZZdqYT1/aOirZ+bpPRH1wuwEpW0L/pSQZOUGdD+K
         HQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOlZ3QEqLCNgmFMKt9Te3xOjoUcpEZV1QZWm040e01Q=;
        b=1kknYRiBKUVNIUmmv0JQyFdoZxWO85il2Dy39plznjIyPGt/y3FlPgoOEMIyOCMAL6
         wEZ1FuuODuvp9GwqkFMxN0+keJK8MxGkw1SEvJnM7L5vCUEmKBXEIWrUvxYl290kAs9q
         Etz94LTnc6dUWy+8XzTZE5MGx40pvNHkADugP2VoqP6dkLZx+ak0iYqy18yLen38vs45
         o7wrvLw0MgRYW/J/eVIZe7y8BfbegI83q7DK3BuXSl8m5L/4rdGvUJvsX9dBZWMZZeBa
         ExnjcJrgfSx2wohpbwEcz6bhI0+KaPyjmTV6YWnSHpb/JbeT4Ar3zHcY8Cj6S/JV3mkV
         NB4g==
X-Gm-Message-State: AAQBX9dWJLWTc/E3Xq2WFSW95RIfiMvt57zpwvJ1OuQjD6vrf+qXQbMP
        TCCDOmk/iPsaniitYKbLEsY=
X-Google-Smtp-Source: AKy350aYTBYp2QLgT56EzGceMkSnpPl7Z0xT2q5LnoYrWcwdaiifF9WzSmmqdOUgD9iwDtCAFXqdLA==
X-Received: by 2002:a17:90b:1b09:b0:23f:91e5:1038 with SMTP id nu9-20020a17090b1b0900b0023f91e51038mr1107676pjb.11.1679621599369;
        Thu, 23 Mar 2023 18:33:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f5e9:5a97:54ee:6f66])
        by smtp.gmail.com with ESMTPSA id gg17-20020a17090b0a1100b0023cff7e39a6sm1888477pjb.22.2023.03.23.18.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:33:18 -0700 (PDT)
Date:   Thu, 23 Mar 2023 18:33:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH 2/3] Input: xpad - remove unused field in VID/PID table
Message-ID: <ZBz93CEkun4mIoCO@google.com>
References: <20230225012147.276489-1-vi@endrift.com>
 <20230225012147.276489-3-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225012147.276489-3-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 24, 2023 at 05:21:47PM -0800, Vicki Pfau wrote:
> The list of specific VID/PID combinations for various controllers recently
> added a new field "xtype". However, this field isn't used, nor filled in in the
> table itself, and was likely added by mistake and overlooked during review.
> Since this field isn't used, it's safe to remove.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry
