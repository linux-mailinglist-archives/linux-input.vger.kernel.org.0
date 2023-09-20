Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 912877A8671
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 16:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbjITOYY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 10:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbjITOYW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 10:24:22 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D95C6
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 07:24:16 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38K3qoLM031049;
        Wed, 20 Sep 2023 09:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=
        PODMain02222019; bh=+jGtuSTNZLnC2z891fWf5OjxuwLr8AWNJ7s8J09PByI=; b=
        RdoxggdIG8S9UVIdb0mpVDaogfyVsZXCxUDT7JC1mzzFVD98Ubc4ZGw1gOhretIL
        dDZqN57NLhoD/MYqeGpodFvMIt0CU/Vw/c2WZ5ieJBhbc0VAhQOM5AC8vrqcDWQI
        X6RGY5r74yMGKD70N1CznKaSU0aKULsB3n5tcZ/4wJezsMVAjQmSff6oz2cbTCbW
        JWOvzYdYi2h1lpqoRlK+YXBNuCK3wamcBKeu1p6lXftG5GLKkVkgcu8TfjRq12M4
        cZ6/zyr18UXhiAjnff9rxhaVKQCWA0bh6++ZkyLsdlpMrLORU7Ko/grQnJOiP+M/
        AwWRRSpKkqKfGjh4ITPr2A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry5jqf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Sep 2023 09:24:08 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 20 Sep
 2023 15:24:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 20 Sep 2023 15:24:06 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 849B1458;
        Wed, 20 Sep 2023 14:24:06 +0000 (UTC)
Date:   Wed, 20 Sep 2023 14:24:06 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <patches@opensource.cirrus.com>, <linux-input@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH 27/52] input: wm831x-on - Convert to platform remove
 callback returning void
Message-ID: <20230920142406.GH103419@ediswmail.ad.cirrus.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-28-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920125829.1478827-28-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 5hEuG_VbausmlwK7LWKYlQXMtzJYrdKO
X-Proofpoint-ORIG-GUID: 5hEuG_VbausmlwK7LWKYlQXMtzJYrdKO
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 20, 2023 at 02:58:04PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
