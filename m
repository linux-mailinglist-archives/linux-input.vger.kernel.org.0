Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23F8E4E1FAE
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 05:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344359AbiCUE7j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 00:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243479AbiCUE7d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 00:59:33 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E02F13
        for <linux-input@vger.kernel.org>; Sun, 20 Mar 2022 21:58:04 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t14so9520168pgr.3
        for <linux-input@vger.kernel.org>; Sun, 20 Mar 2022 21:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6h8PUto5PGYQGx7bAgn/FARy41VUZZQ285HhX6fR5ro=;
        b=myvWOpN5s1QHVuUezVoD10I0F48oMpEftrsiL4PGkpmL50uWuF29ecXBoGNbicXqxx
         iMG847KyAkEXRRNEMnC2UGJet/iucoc222qQSRRWNmJC3qEjvYVyqJuucVIJH1DJB+SZ
         TE46ExsOuYJoRr+iVrX94Qj5RfvL3PLQ6E0SMc3+bWqmZG2x0sMvg7XZaBMx55ri/W3I
         FWD2FpL8QJhLynPGqVL8ZZ4S5u3kV4SBz56lf9xPACM0/WKYqunQxndV9cIrUtA+cqss
         217MPKYOdUluu7zWJXCTf5mLh6ky72dyCOcfKvk/y7uQTbW8RlAGunhAL+7VE7+Vle5u
         +0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6h8PUto5PGYQGx7bAgn/FARy41VUZZQ285HhX6fR5ro=;
        b=XeDmcOhh5R3W40tIDDiwrCElw1j9G+eUNQEGjSFlZkBArYZn+a28YBNRvbGc/3hAaq
         r1r949TrC4w8cvg34fgdkTXKMjUJDlmjIUWvHLscnXU0ja+CVmQfCZY5+waj5AEGHQGQ
         d33qnjXNxHW10D0KCm2abXXJQO6WrFhgpwWE7baztxNbVMlSBG9CXpDn8UklNOJ5EzMZ
         QL/tAK06Z6VA2hLv4V050CXBi1AJFT0ZbJg2IsjOh4D+fZ4S8/KDb3t7YwuYSc8Z97bI
         lAAaKqkdvEdWVaKWNcxIrWOajjVMWKXpEt9176nWzZ9Ipj3cjL9x/VmaWlAaliub9h4f
         xhaQ==
X-Gm-Message-State: AOAM533503w8HMjzp/5rqIvnk020q6YUVZIgaEKyZLg2aRVP/1FcVvkF
        BzTWlEQgeyB7yceZUvxNijE=
X-Google-Smtp-Source: ABdhPJxtIkHkal0G27zKVrEyzLHxAQHbCWAIuf52Ho2aBk8cjNGJ3+F0dnvLKGUqPZWJMAdo9g3MUg==
X-Received: by 2002:a05:6a00:134c:b0:4f7:db4f:f3ce with SMTP id k12-20020a056a00134c00b004f7db4ff3cemr22156236pfu.23.1647838683555;
        Sun, 20 Mar 2022 21:58:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:31f6:c8f1:6f10:b2ec])
        by smtp.gmail.com with ESMTPSA id a22-20020a056a000c9600b004f7ba8b445asm17847420pfv.65.2022.03.20.21.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 21:58:02 -0700 (PDT)
Date:   Sun, 20 Mar 2022 21:58:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Matthew Haughton <snafu109@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - enable InterTouch on ThinkPad
 T14/P14s Gen 1 AMD
Message-ID: <YjgF2Md0j6Hxl5mf@google.com>
References: <20220318113949.32722-1-snafu109@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318113949.32722-1-snafu109@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 18, 2022 at 10:39:49PM +1100, Matthew Haughton wrote:
> Confirmed LEN2064 on my P14s works with psmouse.synaptics_intertouch=1
> By all accounts T14 and P14s are the same hardware which only differ by
> model identifier.
> 
> Signed-off-by: Matthew Haughton <snafu109@gmail.com>

Applied, thank you.

-- 
Dmitry
