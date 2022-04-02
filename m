Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDF34F00C5
	for <lists+linux-input@lfdr.de>; Sat,  2 Apr 2022 12:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354471AbiDBKtl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Apr 2022 06:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349166AbiDBKtj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Apr 2022 06:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 43DD3123BFA
        for <linux-input@vger.kernel.org>; Sat,  2 Apr 2022 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648896467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G63buSfDCPc5qndai6dQxFulpyAndQa2gEdrpbrlGnA=;
        b=Davj8w5YhH8A6T6WE0pCFo4HdOS8C7u1YwTBtynZBj8tQAugCIg8BzQF4fxUHCn9wnbVCi
        GtHcQghjPxe3yyjEv5RyNYwtDcZ56psOd4Tuz44ORWhCdvjwftpmq8uB7NkhcednbeHbnZ
        v16o8ecPnMcKmXpjggfxWMxQ/conb3w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-2hD9y263NzGJRXaf4wWklA-1; Sat, 02 Apr 2022 06:47:46 -0400
X-MC-Unique: 2hD9y263NzGJRXaf4wWklA-1
Received: by mail-ej1-f69.google.com with SMTP id ml20-20020a170906cc1400b006df8c9357efso2673024ejb.21
        for <linux-input@vger.kernel.org>; Sat, 02 Apr 2022 03:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G63buSfDCPc5qndai6dQxFulpyAndQa2gEdrpbrlGnA=;
        b=6x2uRuoViUfjugDFbLHuQFu2m6uWcfhvsRwVIBty98mk0U7YEnI26gCfmGzPAtRxym
         KcVUTELkz5+HZZqTMa6l9ftVwYtj4wsnQ6SEo5/OZ27z/E6/Ln2rJmfs07UN7L1nHrxH
         eGXTkbs3lEUECcNoMUqLZ7AasUoxgjKamu3osqB50MEKrIX1W9JSOi+3wQTO/hamOadk
         s32wBq+qssBoHkrgy5cG7GGdH9mcpeojcj0LfSgcqxpF3op7EauqzxOaXlksF0b2WJ8D
         gvgnmJJczAStrqhPlX9rRRGZqWGkd1UUsJlXRNFAh9CGvKF0AI2UFEK53s1ZxsIg9fBN
         +4rw==
X-Gm-Message-State: AOAM530k3/0ktczvauuvFy2HJhmxuJdmTiHogPCp+M2ObKEkGy5Z0T8f
        Tsa64KSLG5iOjzP7rGPKiTy00sy0gWvCqoHKduXR9DIK0naHrrfMILhmIy55pBYM6ew3SGtCGQ6
        bVotadXycbLAsFS+SkEbG4Ec=
X-Received: by 2002:a17:907:971c:b0:6e0:d0ef:393e with SMTP id jg28-20020a170907971c00b006e0d0ef393emr3349745ejc.562.1648896465102;
        Sat, 02 Apr 2022 03:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrP2K/IEgYHF4LgPlaIoXpl60puqxMAxjpSVRK7WgDbLyj1jOc6xFdNlRwY96jfmdVm1C3IQ==
X-Received: by 2002:a17:907:971c:b0:6e0:d0ef:393e with SMTP id jg28-20020a170907971c00b006e0d0ef393emr3349734ejc.562.1648896464862;
        Sat, 02 Apr 2022 03:47:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id qk32-20020a1709077fa000b006df6bb30b28sm1966976ejc.171.2022.04.02.03.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 03:47:44 -0700 (PDT)
Message-ID: <8a430ab7-024f-51a9-d785-07e03f163261@redhat.com>
Date:   Sat, 2 Apr 2022 12:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5] input/i8042: Rework quirk tables
Content-Language: en-US
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, tiwai@suse.de, mpdesouza@suse.com,
        arnd@arndb.de, samuel@cavoj.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220329143622.31394-1-wse@tuxedocomputers.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220329143622.31394-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/29/22 16:36, Werner Sembach wrote:
> Revision 5 with some fixes based on feedback by Hans de Goede.
> 
> The 1st patch is minor housekeeping.
> 
> The 2nd patch merges the tables together. Minor fixes in 5th revision and
> no more duplication of ASUS devices
> 
> The 3rd patch add optional debug output to see which quirks get applied. In
> 5th revision this no longer breaks compilation on non x86 platforms.
> 
> The 4th patch adds a list of Clevo devices that need multiple quirks.
> With the reworked table they don't need to be inserted multiple times now,
> which was required in v1 and v2 of this patch.
> 
> I also included the extra quirk for the Clevo NS7xMU, which was a separate
> patch before.
> 
> The added Clevo devices are now only identified by their board name as this
> is the only somewhat reliable string that might not be changed by resellers.

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans



p.s.

In the future if you get a Reviewed-by to a previous version of a patch
and the patch does not change (or does not change much, e.g. only
small code-style / comment typo tweaks) you can keep that Reviewed-by
for next versions of the patch, just copy it over to your commit
msg and put it directly above your own S-o-b line.


