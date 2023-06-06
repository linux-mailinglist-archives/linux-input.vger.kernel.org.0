Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4E0723BDA
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 10:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236805AbjFFIdN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 04:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236921AbjFFIc7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 04:32:59 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12538E73
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 01:32:31 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30ad458f085so5147212f8f.0
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040293; x=1688632293;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fc9q2qHL5jMYCGE7PySHZFLs537mv4v3MrceKdnUKcs=;
        b=OW6vkQQ9chgYGfXU8Fz4Dd6SfQH/K06RAZIZkix4GEueAz+KYbJWzpkYklwSapLzsY
         T3oVcoYSSp8WN3XkPHiO4rfu9/svdzkrmfe95JLAcPlFRxMP5L3ocdn6FxGCZODKVWW3
         ejqQIKtrI5gXaDom42lUMuxJQiypC8hspZb3SFM44JzEcOiVEDcJYwVNy7UIGyCMG53s
         u5q7EbhNk9wvQwtVVf1vwio36dcOHuz89Zj4GiQl3DgSqwSWTczwDy/DOhG0eCoxsa+O
         exnaj8n1+aYJn7U17T61ZY8zFwlzD8G8M1c+LRWkKk56NfPirWX9VR4h/9JtOmU33X/J
         MyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040293; x=1688632293;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fc9q2qHL5jMYCGE7PySHZFLs537mv4v3MrceKdnUKcs=;
        b=F4Z0eHonSUPoYVLaAUeUGVotIGRiGVyo/m1S2dVK2z4XPooiLnvYCBYBduzBHFe1iN
         LFCcufibAtjA9nUGorvMLg25nolbkd6O0SX6tkhdXHPBgufpPfnKB/BvT+8M7pyNigNA
         dp6GHBgf+udGFdV7zqmzay4xCK4Dgzt/wLn2S22OXyHv9meOEovUjF5xqWm7lsAClg/X
         g8g0msmeFBuQmXUx3zQxUMw9PXYdrTTHSoHVtEMGvpwWXtOV0c6Ujz2JlSH9xM0iECyl
         s5Mpwx2t6s5mD9yecveP00Jjs/wQUdrmJfD1UayY1L95upxhpe0WjqfMX7Qsf/J6Q/+D
         00Zg==
X-Gm-Message-State: AC+VfDxilb00IoiHj7D4MFT9zPscP3SSUQMfZdpXEEk1fS3siC0sXUbN
        o9MpXZk7e33KfGGRRBGF4cAAtfWbXfWe7rKzkOw=
X-Google-Smtp-Source: ACHHUZ7XyNPZAg39PlFM9LgOZmnl8mqUAe7xTYe8d/zpd1W4+BKscg1pbKoj6kuuzO3yUw4KLjYZog==
X-Received: by 2002:a5d:6a92:0:b0:30a:8edc:8567 with SMTP id s18-20020a5d6a92000000b0030a8edc8567mr1080314wru.8.1686040293430;
        Tue, 06 Jun 2023 01:31:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600001c800b0030af72bca98sm11929833wrx.103.2023.06.06.01.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:31:32 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:31:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Subject: [bug report] selftests/hid: add tests for bpf_hid_hw_request
Message-ID: <ZH7u4NDGLcqfCrTk@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Benjamin Tissoires,

The patch 4f7153cf461e: "selftests/hid: add tests for
bpf_hid_hw_request" from Nov 3, 2022, leads to the following Smatch
static checker warning:

	./tools/testing/selftests/hid/hid_bpf.c:214 uhid_event()
	warn: assigning (-5) to unsigned variable 'answer.u.get_report_reply.err'

./tools/testing/selftests/hid/hid_bpf.c
    203         case UHID_CLOSE:
    204                 UHID_LOG("UHID_CLOSE from uhid-dev");
    205                 break;
    206         case UHID_OUTPUT:
    207                 UHID_LOG("UHID_OUTPUT from uhid-dev");
    208                 break;
    209         case UHID_GET_REPORT:
    210                 UHID_LOG("UHID_GET_REPORT from uhid-dev");
    211 
    212                 answer.type = UHID_GET_REPORT_REPLY;
    213                 answer.u.get_report_reply.id = ev.u.get_report.id;
--> 214                 answer.u.get_report_reply.err = ev.u.get_report.rnum == 1 ? 0 : -EIO;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is a u16 so it can't hold negative error codes.

    215                 answer.u.get_report_reply.size = sizeof(feature_data);
    216                 memcpy(answer.u.get_report_reply.data, feature_data, sizeof(feature_data));
    217 
    218                 uhid_write(_metadata, fd, &answer);
    219 
    220                 break;
    221         case UHID_SET_REPORT:
    222                 UHID_LOG("UHID_SET_REPORT from uhid-dev");
    223                 break;
    224         default:

regards,
dan carpenter
