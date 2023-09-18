Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0347A50E6
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 19:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjIRRZH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 13:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjIRRZG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 13:25:06 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF1B11F
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 10:24:59 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-760dff4b701so60008339f.0
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695057899; x=1695662699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHmyNtZRGj+r/j/G7CbRibxxcZBx+UTQ5mP0xbLF240=;
        b=IE5+O2n0ShLxXU829jR1cINfhvWeMXuKxxmgOV/xM08cpVvbixRLLIRlHA3MkMXHOZ
         wj7od0nV265UlEfALm68RPTbDRACmwEQkalGfNRwgJRHjSjGyKeyeEjxXvibeeYrMW3l
         WH4J0ztK3mkbcmYx9AyI8ATHKHtGrjxPCStlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695057899; x=1695662699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHmyNtZRGj+r/j/G7CbRibxxcZBx+UTQ5mP0xbLF240=;
        b=svf6KzTQd34f2ONqMHVl/bkitgaw3hgkHcTSWEENrJuCcUXrqryvEogpJ8UrjCYX1X
         LGfp7hsEleStZPibU9qYzHIm+ECERGAAUcrREH9SBImr6FFeDSmxSJ3fA1STDDZoyHgW
         E1TdzobRyGuMlKGMhIJzjBhyQd5khlCY1EufhGZFfPcRHEdjaVs8EEYhjwL/pDcQibNi
         7fUMFRDxDtmEz+GecjxnOTva88rMbEJlTGmviB8bGBi5QE6GChRNrZYl1kM4n7gVc5Uc
         9VsfMRwhj6JVlnCnCtP/l3lrQEu0uWON0khvHQpIqEEJWHRUlqvX6ekz8eRQ+jzX/Nn8
         TWZg==
X-Gm-Message-State: AOJu0YxEH1sB9bUuoq10eexBXz+uR1SOt1K8p2mablRsG31sFN2tPcrz
        wsqo6rTfNAjm66YGL/SAtap0cg==
X-Google-Smtp-Source: AGHT+IG8zSvNfr6+khcoHiE7xQDRSFBwUFrI6G55nMfl8DKpv4GXtM1aJNknfr8iPELEl9G5ZXABiw==
X-Received: by 2002:a6b:3bce:0:b0:790:958e:a667 with SMTP id i197-20020a6b3bce000000b00790958ea667mr11136825ioa.2.1695057898872;
        Mon, 18 Sep 2023 10:24:58 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id h15-20020a056602130f00b007911db1e6f4sm3056358iov.44.2023.09.18.10.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 10:24:58 -0700 (PDT)
Message-ID: <2535d4a7-62fe-c9b2-3b86-cf418760087e@linuxfoundation.org>
Date:   Mon, 18 Sep 2023 11:24:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/3] selftests/hid: do not manually call
 headers_install
Content-Language: en-US
To:     Justin Stitt <justinstitt@google.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Eduard Zingerman <eddyz87@gmail.com>, linux-input@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230908-kselftest-09-08-v2-0-0def978a4c1b@google.com>
 <20230908-kselftest-09-08-v2-2-0def978a4c1b@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230908-kselftest-09-08-v2-2-0def978a4c1b@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/8/23 16:22, Justin Stitt wrote:
> From: Benjamin Tissoires <bentiss@kernel.org>
> 
> "make headers" is a requirement before calling make on the selftests
> dir, so we should not have to manually install those headers
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

Thank for making this change. Just check bpf continues to
compile and run though.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
