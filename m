Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDAC14DD67F
	for <lists+linux-input@lfdr.de>; Fri, 18 Mar 2022 09:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbiCRIwR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Mar 2022 04:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbiCRIwR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Mar 2022 04:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96653FE421
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647593457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vWPskzqcY46f0JaJnrGxtCfxiJknIp7ZEMxWr9RfTK4=;
        b=Kg1YjP9q6u3uRwgwu3NQ5Ny2TKIeTxtPbnqUP8iQa6vy+0DZmqSi7w7EU2Nseis8hSEE1P
        N825lspCiDTIi5dXCgxNr034h6n6TRw7EbfU4YgOQtlHJNju6qivq9BSb/opTNZDIB+BDv
        f0qfaEDVBuyFPEr8iXOl+9xhIwEXQb4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-B1AiZnOFOzS3sI42GhkpTQ-1; Fri, 18 Mar 2022 04:50:56 -0400
X-MC-Unique: B1AiZnOFOzS3sI42GhkpTQ-1
Received: by mail-ej1-f72.google.com with SMTP id gz16-20020a170907a05000b006db8b2baa10so4227175ejc.1
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 01:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vWPskzqcY46f0JaJnrGxtCfxiJknIp7ZEMxWr9RfTK4=;
        b=Dp2Uj23xcNgVFr1D45uJQq8sr8FQl7MOi3+JvSuhGKjjGA9VDPLfo/Mfc0lIK6LXPV
         ZY5mE6X3++qCl4cOQ4zVI/mwOabj12zJo/tmJQ0WXlbfzOcbBiIJUhaJ08gk0Hk1xhfO
         QecQ3hNGO5RUcAp4w01NfPYkpnInPih/3W64fHIxSxV1c6G5DghEFXubzTdEPbZ4xByr
         XxDTI39DcF3PMndDdVdZ7l2+HAeU7Wecwp98jYg7r1ztPgl9RUG/dc4kcqD0msxc2b2W
         ibBovAI1JRMgn/K+pdzmmLxbv/TRFOIzMgCisI/SWUoTsXZm23JPEucojQcLPO1FQ+ex
         MyPQ==
X-Gm-Message-State: AOAM531FLtfq41ixb4YmFri7YRG4c5ztQ/HYjS9/8dh37EAeCgrVOyGJ
        mqN0tjIHskOg7d3nqRIXlWyiUOxlXR3Zk53Y81I150leZwYqu+ipzK4eHTDWXTD29dkuFLypi8K
        wDfuQqmKf2Ixe91np7VWuBbk=
X-Received: by 2002:a17:907:3fa8:b0:6d3:477a:efe with SMTP id hr40-20020a1709073fa800b006d3477a0efemr8338453ejc.401.1647593454982;
        Fri, 18 Mar 2022 01:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJay5hdPvuYvu3/VMN0nnuMDTYfBT+fr0PDYGOsPRW9BUBjZ0o1c7V1picE8ujxf73nYdLYg==
X-Received: by 2002:a17:907:3fa8:b0:6d3:477a:efe with SMTP id hr40-20020a1709073fa800b006d3477a0efemr8338438ejc.401.1647593454796;
        Fri, 18 Mar 2022 01:50:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906144b00b006cf61dfb03esm3430834ejc.62.2022.03.18.01.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 01:50:54 -0700 (PDT)
Message-ID: <aac830c9-6c65-d824-4cb8-2dd81f2347b3@redhat.com>
Date:   Fri, 18 Mar 2022 09:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Dell laptop touchpad disabling?
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Randy,

On 3/18/22 01:32, Randy Dunlap wrote:
> Hi all,
> 
> I have a Dell Inspiron 15 5510 laptop. Of course, it has a touchpad
> (which I think of as a nuisance pad).
> I would like to be able to disable the touchpad easily.
> 
> Are there any best practices or suggestions for how to do this?
> (I am using xfce4 as the desktop environment if that matters.)
> 
> 
> Sometimes the touchpad is discovered as a PS/2 Generic Mouse on
> the i8042 AUX port, and sometimes it is discovered as this
> touchpad: "DELL0B24:00 04F3:3147 Touchpad" on some I2C device:
> "i2c-DELL0B24:00". (The different discoveries might have something
> to do with my kernel configuration/builds, but I don't know that
> for sure.)
> 
> I have some very hackish scripts that I can run to toggle the
> 'inhibited' flag in sysfs (/sys/class/input/ for the I2C device or
> or /sys/devices/platform/i8042/ for the i8042 AUX port device),
> but that requires root (sudo), so that does not qualify as "easily"
> IMO.
> 
> E.g.,
> $ sudo toggle-aux-mouse
> or
> $ sudo toggle-i2c-touchpad
> 
> depending on which configuration the device is in.

The touchpad is supposed to be always recognized as, well a touchpad,
so you want it to show up as "DELL0B24:00 04F3:3147 Touchpad", as
you said this likely depends on your kernel config.

And then usually the desktop environment will give you an option
to disable it. At least GNOME offers a clear on/off toggle see:

