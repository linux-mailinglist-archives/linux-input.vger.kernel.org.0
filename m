Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4B485AC5C2
	for <lists+linux-input@lfdr.de>; Sun,  4 Sep 2022 19:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbiIDR1X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Sep 2022 13:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbiIDR1W (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Sep 2022 13:27:22 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA8B33A2F
        for <linux-input@vger.kernel.org>; Sun,  4 Sep 2022 10:27:21 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id q3so6423531pjg.3
        for <linux-input@vger.kernel.org>; Sun, 04 Sep 2022 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Q8Zw7aUyfayXO6GRI49Ye/PPH9m7d9H0vCVDYmUxzKE=;
        b=o5qh7PgDzG5DC0vCQyzGXps8cfwLBvtZhaKM6MoLHB6m3a/3ZentKn9kuajRJnzepn
         0EMCADnIIzO78cG4a/B0sAQxVYtBWZyDM2CiMTeXF+nGj5Vnur1MqLnggC7iUW5DrB6m
         6a1CCe+mQNDtZI2CoACFNrk2tPaHKWRVYibDY+QN1PV+8ZIYLDpDHn3SLPtEe7v9GBV1
         VdImnOPHxrE6qr1s5Z/enISDgyRzwCX0SA8MTh8h30NkzFMkQGg42dg9ON7LYJI5JSIP
         XhijplO58vVvFu8HMr9aJUV43hQusVlxV3hpYK+QL94cC3A1V3ve/uSX+NO5PIgbLIJm
         zMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Q8Zw7aUyfayXO6GRI49Ye/PPH9m7d9H0vCVDYmUxzKE=;
        b=UUf1M0Fmlpigxu31hbHnb+YgUjmrl3wKI9pVPXhQOCsBnZT4IdSbayScSnqCkgikyp
         6kgIpll/3WjOKHVXnSMfij+4Lijq7uRepNMwhEDJ1O+U6fbe290xgQVWT3FI/Tpsut3J
         2RSFaBX0tdOKiU8uoUypz8n9ehj/wyImnTswkcwWsWWCZL2RmszGy8XBXNK5KYYQjcXS
         9hlG3uD0ERGPakKZ7YSSkg8dXomVpQQBygwTZ0c8IRMM19ovrH5LtR5oXoNf6AwR8vl1
         m/t8tsEYNe1yqdLIpmKM+LKnk/NrVhxSIkPMSief3q28OQFTLS7ynr/t6c7FYP10udEc
         dY+Q==
X-Gm-Message-State: ACgBeo0blXU9rY2tqAEbdc5YiU1F//sjSy9mm/kvRnbFaMWNm9eF0OZc
        V+kUQ79ymjp30fTfk7Ymo1U=
X-Google-Smtp-Source: AA6agR7iwvepjdcow1lRbLdlxPoRBsPjrq7DVTgWL1ZDk0nc/hLSQ/u12FawWpL2hzhbAqexLl+RNw==
X-Received: by 2002:a17:90b:1a8c:b0:1ff:fc6b:1de8 with SMTP id ng12-20020a17090b1a8c00b001fffc6b1de8mr12336408pjb.206.1662312440845;
        Sun, 04 Sep 2022 10:27:20 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id b68-20020a62cf47000000b00537bdc9c2f2sm6074748pfg.170.2022.09.04.10.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 10:27:20 -0700 (PDT)
Date:   Sun, 4 Sep 2022 10:27:16 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     erazor_de@users.sourceforge.net, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
Message-ID: <20220904172716.GA26269@ubuntu>
References: <20220626111330.GA59219@ubuntu>
 <nycvar.YFH.7.76.2207211159210.19850@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2207211159210.19850@cbobk.fhfr.pm>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear all,

This drivers/hid/hid-roccat.c code doesn't seem to have been patched for a long time.
I'd appreciate it if you could tell me how to make the patch I submitted above take effect.

Regards,
Hyunwoo Kim.
