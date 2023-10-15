Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5727C9875
	for <lists+linux-input@lfdr.de>; Sun, 15 Oct 2023 11:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjJOJ0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Oct 2023 05:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjJOJ0g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Oct 2023 05:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17490A3
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697361948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=31Eusasdtb6XfWs3sVlRzfprptFaPQHGiHl6WVNZrQQ=;
        b=P3ipgzMwE5hUeq/yBk36w+t1BTGZElTcv8C5pUTKoJbhpJHtkqaKYoYVsne4fKbH7KSVqC
        MBczeye0HRTJYCQ0hEYmiF/M0L6l7EB7DZXRBatEZkAh4JVcfoGH8f2V8CSaKRKuXHMQEf
        wo7EDUTOJAZyX9TL6fBOBCPnnuC+SOs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-VQjRP21eNWmV8md_AgRseQ-1; Sun, 15 Oct 2023 05:25:45 -0400
X-MC-Unique: VQjRP21eNWmV8md_AgRseQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9b99b6b8315so255828366b.2
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 02:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697361944; x=1697966744;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31Eusasdtb6XfWs3sVlRzfprptFaPQHGiHl6WVNZrQQ=;
        b=GD1twUpyIZGtaLl56oFM9Jvu7QM3h6w3DmLwlmSyUDXAaGwZVrXy6ICXgjgWD48VvS
         NLQWEaYDKXb03FZp7NHNHvYTY/2dpo/zk24XkEWCo/fQfs1radddoCVm2PN65cssqMhM
         fEoPb0OFf0nFULToRj7E5b4Jhv+5o5CO9+14K6LT9hMd90yo0z6weccWsNFqkoGTKTLN
         7tIQKzCG0bH1yY9tQVhtrujpBfSbfv8zt8TdP07/CamD1Pt7hQJEbkvMOXuWJTTaqKx6
         F19AIx2Mse4OGPGS8l8eN3NblggCPWT4uufgm8ANiTrQA4YuYOypjDh1G+x5toNKcZUK
         iDXA==
X-Gm-Message-State: AOJu0Yx02Fm4Ks/r8gIEzJGhMNSW73I1j9TyqvUGDZdUGfm09Q/nATrj
        T1orpYilqR+D9KozbsQJEBbDNI+IM9K0tHRCQ+SHwZrFGGhxZwBNKQcH0r9CzECT1ah7ESMSEGj
        zlQSrcoZRiUMWIG7wM98TJks=
X-Received: by 2002:a05:6402:2293:b0:53d:7be0:4a93 with SMTP id cw19-20020a056402229300b0053d7be04a93mr13372349edb.11.1697361944457;
        Sun, 15 Oct 2023 02:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1EF1dZk+JtyVqgGJ9JAtt/W/jw73QcGgCjbXsRPBOl92QblacMHZ+qMcH9o82NCnLqgnaiA==
X-Received: by 2002:a05:6402:2293:b0:53d:7be0:4a93 with SMTP id cw19-20020a056402229300b0053d7be04a93mr13372341edb.11.1697361944046;
        Sun, 15 Oct 2023 02:25:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f26-20020a50ee9a000000b0052e1783ab25sm13786884edr.70.2023.10.15.02.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 02:25:43 -0700 (PDT)
Message-ID: <b70fc1c7-caba-6b88-42b5-b37a39396fc1@redhat.com>
Date:   Sun, 15 Oct 2023 11:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Help getting ELAN066C touchpad working in Linux
Content-Language: en-US, nl
To:     Jonathan Dieter <jdieter@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <27131a7fae2794a63f4f285a20e41116ba4198f3.camel@gmail.com>
 <f5016787-c4c7-c8d9-f208-6e355d8b7db0@redhat.com>
 <4a1de7c3dfd7c2d2ced08c6d2b589555c1205dab.camel@gmail.com>
 <fdfc2766-0885-7cbe-0e96-6358a08aa3c7@redhat.com>
 <f37f08d92587b7ecdbc32cc071dbabe7738695a2.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f37f08d92587b7ecdbc32cc071dbabe7738695a2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

On 10/14/23 23:16, Jonathan Dieter wrote:
> On Sat, 2023-10-14 at 22:30 +0200, Hans de Goede wrote:

<snip>

> Hans,
> 
> Thank you so much!  Adding a DSDT overlay worked perfectly!  The
> touchpad is functioning exactly as you would expect (using the
> i2c_hid_acpi driver).

That is good to hear, so that confirms that this line:

         If ((^^^PCI0.LPC0.H_EC.ECRD (RefOf (^^^PCI0.LPC0.H_EC.TPTY)) == 0x01))

In the DSDT is not functioning as it should under Linux.

<snip ls -l /sys/bus/i2c/devices/ which looks good now>

> Is there some way we can get a fix in the kernel for this buggy ACPI table or should I be asking Lenovo for a fix?

I assume (and it seems so) that the:

         If ((^^^PCI0.LPC0.H_EC.ECRD (RefOf (^^^PCI0.LPC0.H_EC.TPTY)) == 0x01))

line in the DSDT does work under Windows. So now we need to figure out
why it does work under Windows and not under Linux.

Can you please run:

sudo acpidump -o acpidump.txt

And then reply to this email with the generated acpidump.txt attached ?
Note please drop the linux-input list from the Cc when sending the acpidump.

Then I'll take a look at the full DSDT and we'll see from there.

As for getting a BIOS fix for this, I think that the chances of Lenovo fixing this when asked are not good.

Regards,

Hans


