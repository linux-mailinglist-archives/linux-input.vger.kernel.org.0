Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E67775E46
	for <lists+linux-input@lfdr.de>; Wed,  9 Aug 2023 13:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjHIL4M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Aug 2023 07:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjHIL4K (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Aug 2023 07:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A33D10F5
        for <linux-input@vger.kernel.org>; Wed,  9 Aug 2023 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691582119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Zt7LqWIunD9uLiutnGg/r/aysylTVw0JM0XLVqjNXY0=;
        b=WaVAesjaMn0vYFBRyd/4cMxmU8onKb13yo7OL5Ygpdg8k4dPniQDj9zghP57B16BdSCT5Y
        1ixcisOMEmLDMuOOjex1oR6tV6uxb6Y2HE1pNO3CgLfFpnhTnCIp/2tz/fJEn01REGllWE
        b0ajT9197eA9DETjnAxqD4VZaFng37A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-Y01Tnt9_Mi-gwVQdsEghLQ-1; Wed, 09 Aug 2023 07:55:18 -0400
X-MC-Unique: Y01Tnt9_Mi-gwVQdsEghLQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30e3ee8a42eso3219842f8f.1
        for <linux-input@vger.kernel.org>; Wed, 09 Aug 2023 04:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582117; x=1692186917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zt7LqWIunD9uLiutnGg/r/aysylTVw0JM0XLVqjNXY0=;
        b=LBy/xWRr2GEwpU/ivBqmGbUY8HWWJWaIYKnafzuuGmJb1nSdRmPL1PVtPkroCk3NSP
         PkgS2++RAamLSBNeeQifA07L6yb/cLhBPDNeDGc4E2O6fl6GSsmQmxnvKGXqUULnOvlL
         MwUfCgN7sl1kq4jvE63zhXoHnDVyfbv7EALqUNgCKuIE/ZaW4zmyKV07rvh8ejxb+HAM
         bDvB12pNSnUgKTNLgX2fpj8LYJXn+uxLmeM+5UCLIbRqyF976d06HoM4y0CpQLuVAgoN
         QuIJI/nixOFO4c+A6G66Aut7AFvWWwP3Ubf/Ap0i/7Qdp2x+8ZcU6Tt2uYWocfHMJeyO
         2pHA==
X-Gm-Message-State: AOJu0YzKQuVMtOEvR1O7lalWMq0nWAgBuZZNWkvXtCeHsMzRpqmNgoMW
        ZCSMef7BkoEsA87JB86BxAh0jBxldecdnYmplbChA+Kcm0smcgps6OP88mXxMjNG9U3029btTLs
        9hmYcpj7o1mChqbguoMkA7i4o36mpfqNOsg==
X-Received: by 2002:adf:ea4d:0:b0:314:2ea7:af4a with SMTP id j13-20020adfea4d000000b003142ea7af4amr1808928wrn.13.1691582117236;
        Wed, 09 Aug 2023 04:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr93v0hyLIHcW/k6hETjK36rH1EoKsKnUopp5Llatjqvyl5Un4GPc3urRSOdmONvRVRXAw3g==
X-Received: by 2002:adf:ea4d:0:b0:314:2ea7:af4a with SMTP id j13-20020adfea4d000000b003142ea7af4amr1808911wrn.13.1691582116897;
        Wed, 09 Aug 2023 04:55:16 -0700 (PDT)
Received: from toolbox ([2001:9e8:89b3:0:aff2:5f1a:8020:9f92])
        by smtp.gmail.com with ESMTPSA id r2-20020a5d4942000000b003063a92bbf5sm16596618wrs.70.2023.08.09.04.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:16 -0700 (PDT)
Date:   Wed, 9 Aug 2023 13:55:15 +0200
From:   Sebastian Wick <sebastian.wick@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lyude Paul <lyude@redhat.com>, Aman Dhoot <amandhoot12@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Raul Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Input: synaptics - enable InterTouch for the
 ThinkPad P1 G3"
Message-ID: <20230809114242.GA24649@toolbox>
References: <20230808152817.304836-1-sebastian.wick@redhat.com>
 <f13f4ff7d46ecf887ca652b664860c4e07ec8b73.camel@redhat.com>
 <ZNK8aG/y4ol7MXVp@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNK8aG/y4ol7MXVp@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 08, 2023 at 03:06:32PM -0700, Dmitry Torokhov wrote:
> On Tue, Aug 08, 2023 at 05:49:23PM -0400, Lyude Paul wrote:
> > Hm, This looks fine to me (if not as a final fix, certainly as a workaround)
> > 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > However, this is definitely something we probably should try to fix at some
> > point - as I imagine this must be happening because something regarding how
> > clicks are reported must have changed again. Andrew, do you have any idea?
> 
> I would like to understand more about this. Is this with newer/older
> BIOS, or another hardware revision of the product, or something else?

All I can say is that the touchpad worked fine before and at some point
it stopped working. I remember updating the system and some firmware
components shortly before this happened but I don't know anymore what
those updates contained.

> Lyude, do you still have access to the unit you originally developed
> the original change for? Is the behavior broken there as well?
> 
> Thanks.
> 
> -- 
> Dmitry
> 

