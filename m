Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1904D770995
	for <lists+linux-input@lfdr.de>; Fri,  4 Aug 2023 22:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjHDUTe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Aug 2023 16:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjHDUTb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Aug 2023 16:19:31 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F028E4C31
        for <linux-input@vger.kernel.org>; Fri,  4 Aug 2023 13:19:28 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-686f94328a4so1720338b3a.0
        for <linux-input@vger.kernel.org>; Fri, 04 Aug 2023 13:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691180368; x=1691785168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noF5lwIo2lfINQdYFWU+Lq1JvkqhF+AtQzYf8wSCzpw=;
        b=kP/yaf2HYhhUucx5pbOLnmAm4F6kKBUWqhWkFeJpeBYwyWEuJw7B0zOpJPzXwYkMiv
         UQAefMA71/OcRfsCX0X+qRqk2hY935pyLJrUQcblKOYMM9ycq2RPcWvTVGjk2kcEe3+8
         8rh9K6sCB78HdTqYVEUEAvZi+T8j61r+KtZvMpcs/v69tszmnqhxB3PzG9daJfgjfPHq
         eNM6uqSGqdQzHDIJR9vAKhJVwc9KRS4Z2EQ9arv1jPph6z9oV/qqOCMJcY3xCHInAg2x
         zesszI61SC21PgKsM1aHOtuqKc++C2ir671JKNBi16VAxHt54sTb5GZaOTPIGmaVNiIR
         RY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691180368; x=1691785168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noF5lwIo2lfINQdYFWU+Lq1JvkqhF+AtQzYf8wSCzpw=;
        b=OvX2nvz2p8rQMb4CLfrC4p3RZPkgdtpDJxXqYQUFmeDEJYHt33WJuENtkByIgfxylY
         xArfS+3ymxn9u3dDzoufEmyl5Ve/fd06dYe+m9eQCsST06H5X7W4RAE5gTlCjrrjCNp2
         K8pFZqFBTITTG9/7+o/0oTHPTaqkiKEGfYkDUTAgdWvx/0BnfSzZkMEI5Jr0O/WmRzx4
         croqD1YOThKNq1w4TapichjQ2OubD8mbO8xq4AHrlFbaeME8wj2QnfAvc6jiGZTrai8A
         diZ4H1nR/B6UAKu8fNh5u4/Q5n3yrLItbXGYEHqW/KN9sJdaubJ1gf35/8Mk/3P7Jbq7
         ucCQ==
X-Gm-Message-State: AOJu0Yx716d+L8e8iryMhon5ezWSCmabJIJknujcz8Cln9nRA1CuVpHy
        X/F0jeg7NfeXBaSQ48+0b7PZFD6wCZp9BA==
X-Google-Smtp-Source: AGHT+IFzcV1aZchRZRKQnGfXioMWBDEDXFZ95kLcVnIx+8Mmqhv1u9dun/WCRbpU6KBqtR0k1lqPqw==
X-Received: by 2002:a05:6a00:134d:b0:65e:1d92:c0cc with SMTP id k13-20020a056a00134d00b0065e1d92c0ccmr909399pfu.10.1691180368043;
        Fri, 04 Aug 2023 13:19:28 -0700 (PDT)
Received: from google.com ([104.129.198.114])
        by smtp.gmail.com with ESMTPSA id y18-20020a62b512000000b00687a4b70d1esm61936pfe.218.2023.08.04.13.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:19:27 -0700 (PDT)
From:   HP Dev <hphyperxdev@gmail.com>
To:     rrameshbabu@nvidia.com
Cc:     carl.ng@hp.com, chris.toledanes@hp.com, dmitry.torokhov@gmail.com,
        hphyperxdev@gmail.com, linux-input@vger.kernel.org,
        maxwell.nguyen@hp.com
Subject: Re: [PATCH V2] Input: xpad - Add HyperX Clutch Gladiate Support
Date:   Fri,  4 Aug 2023 13:19:26 -0700
Message-Id: <20230804201926.10723-1-hphyperxdev@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <87o7k027p9.fsf@nvidia.com>
References: <87o7k027p9.fsf@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rahul,
Is there anything else we need to provide?  When can we expect the patch to be rolled in?
