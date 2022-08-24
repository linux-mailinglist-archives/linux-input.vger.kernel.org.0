Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90E4759F688
	for <lists+linux-input@lfdr.de>; Wed, 24 Aug 2022 11:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236352AbiHXJlu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Aug 2022 05:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236291AbiHXJlr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Aug 2022 05:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDC6357DD
        for <linux-input@vger.kernel.org>; Wed, 24 Aug 2022 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661334100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rXZAbOi80OJv3uidummRV0C+m8Czemv1wTSXuU14uGc=;
        b=VJEfDpNjGyrobgAqnyun+yn3psPImZfwklCb1RpXEfnbJwz3gG9EPsKzkYBQSNrNuYCoc7
        8HVX23jNjdTcioEpI1MwhfRes3CrGyG6hDu8nW78V0cEIlM6qYH/F/qEaunDQmY7n4qiXS
        eOjl6CDz3RdRg0d7MW5xtEvbdJ9oyLE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-ImYQuzcWNA6XoP4uPvRplw-1; Wed, 24 Aug 2022 05:41:32 -0400
X-MC-Unique: ImYQuzcWNA6XoP4uPvRplw-1
Received: by mail-wm1-f70.google.com with SMTP id f18-20020a05600c4e9200b003a5f81299caso9198037wmq.7
        for <linux-input@vger.kernel.org>; Wed, 24 Aug 2022 02:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=rXZAbOi80OJv3uidummRV0C+m8Czemv1wTSXuU14uGc=;
        b=NmnM4D0AoD/4mzKQ5aShcDJEAqZecpauFFpKFEhxvjWXBK4qWles1chO38rAXVTiMJ
         XeNUsRbOie6lGCA5WEmL8ofnRLhken4K39aXCdNAbzl70XSA9ZgARCRkF4bqmZDG2Wvg
         VBTqV7xkCjYXXGLaf402BB5Oaqvl5dyvJTqCQm9HaBknDc+edUQu92LhehwyEENqM61C
         Pdjh082a1XyYZ0m3h6o2cgPgLpbevGgJo61iciShd0uHiiGEsmWFrn7O+tPoRUWN2ZAt
         IM5basENZa5E792/KFdiwgagO2bCsyYfLFyv2+lAR6jvOT8SnjOJ3JgYIGYDoeHcOnjZ
         dy5w==
X-Gm-Message-State: ACgBeo0de1Q1EYXtHrvyD5xErvbFIwdATNDuInJuyuAKZdSF+Z/1V/w/
        EmBSPNLgG8UDr9XjI8V0Oli7TNQQ3qupsCHzUblAfwSY7gdUml/8xuJN2OpXnGdF12BYutza9lx
        fMTiRag2UYeCBSdhd7lwvYS0=
X-Received: by 2002:adf:e4d0:0:b0:225:2947:3a5f with SMTP id v16-20020adfe4d0000000b0022529473a5fmr15483114wrm.387.1661334090891;
        Wed, 24 Aug 2022 02:41:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6A/ocXjWVRFdjan3P7MYJXQ6e2K34PdNA3e511oLDRA0aYA/dzfItM+B5KpyFeSSw6ofRRhg==
X-Received: by 2002:adf:e4d0:0:b0:225:2947:3a5f with SMTP id v16-20020adfe4d0000000b0022529473a5fmr15483088wrm.387.1661334090693;
        Wed, 24 Aug 2022 02:41:30 -0700 (PDT)
Received: from [192.168.110.200] (82-65-22-26.subs.proxad.net. [82.65.22.26])
        by smtp.gmail.com with ESMTPSA id bh19-20020a05600c3d1300b003a2f6367049sm1335730wmb.48.2022.08.24.02.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 02:41:29 -0700 (PDT)
Message-ID: <ecb5c967-9913-73e0-65a6-e35893eee411@redhat.com>
Date:   Wed, 24 Aug 2022 11:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH bpf-next v7 13/24] HID: initial BPF implementation
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
References: <20220721153625.1282007-1-benjamin.tissoires@redhat.com>
 <20220721153625.1282007-14-benjamin.tissoires@redhat.com>
 <YuKaG18WXkkQlu8e@kroah.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
In-Reply-To: <YuKaG18WXkkQlu8e@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Greg,

On 7/28/22 16:15, Greg KH wrote:
> On Thu, Jul 21, 2022 at 05:36:14PM +0200, Benjamin Tissoires wrote:
>> diff --git a/drivers/hid/bpf/Kconfig b/drivers/hid/bpf/Kconfig
>> new file mode 100644
>> index 000000000000..423c02e4c5db
>> --- /dev/null
>> +++ b/drivers/hid/bpf/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menu "HID-BPF support"
>> +	#depends on x86_64
> 
> Is this comment still needed?

Nope. It was required a few months ago, but I think we now have 
trampoline support also for aarch64, which are the 2 main architectures 
we care right now.

Dropping this from the series.

Cheers,
Benjamin

> 
>> +
>> +config HID_BPF
>> +	bool "HID-BPF support"
>> +	default HID_SUPPORT
>> +	depends on BPF && BPF_SYSCALL
>> +	help
>> +	This option allows to support eBPF programs on the HID subsystem.
>> +	eBPF programs can fix HID devices in a lighter way than a full
>> +	kernel patch and allow a lot more flexibility.
>> +
>> +	For documentation, see Documentation/hid/hid-bpf.rst
>> +
>> +	If unsure, say Y.
>> +
>> +endmenu
> 

