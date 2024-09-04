Return-Path: <linux-input+bounces-6211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20C96C9E5
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 23:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97DD1F28747
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5FA153812;
	Wed,  4 Sep 2024 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aQ+qBYP5"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16A148FEC;
	Wed,  4 Sep 2024 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725487017; cv=none; b=FFTA9rgl/IvwOxTN1PxM+YJn68NkLibb/phmtkQ204AMyuLcwnnst1R30zMiIaqZy/chaqMWpNd9nhg3aDfP/EEo99Rlw54rTDbpptNWBEwraTboEcWkyESHVZAzHuwwIF5V0mM6wyXauM18kEdOSbLBACjtGT0bdSb5GpTqR58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725487017; c=relaxed/simple;
	bh=E+Rgzio483xxU+JEVGgFsyQwHHi7k/yI10zOLscizJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4QJFSHF4/MADhHVU6oVml92DCGfqF1/EKB2UvRUYiLiuC4am6q3Iu97cY6LYkP0snhBhLKo0m948JfbaxYuJmbbQk5EVK25nHX/GAVJPG7f3OLlUPOtUnfPj+l2FjwF2WxJazzdrYnEU3wROkOY7aV291IkQpazfETBMCAZfes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aQ+qBYP5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484HIVCD015193;
	Wed, 4 Sep 2024 21:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=K
	a0SM+/EsF9U7dI3SIKxZnLderdvpEctbCGmzYggbNw=; b=aQ+qBYP5FAmIcrSIM
	nATbyYmYmNUyLTDyacDzUPMKxxAe8N2j+jaCILxqpFcmbax/c7c2jjGirorBYEzJ
	qeh9S4dUBBfotx5thjB1fZcku0XOrSBR+/tYpD/YucdNt7gbanqmoNmHF9GpoiV/
	DYZaHg/13swOtPxwXQkHf2oZvkbkLr7mJTRy4pWWhDGb5+P0cIYQpXunL9CYsRSm
	L2o0GKxp+82WvwJrCwylr7Y0LKDWs7IvCB9EKj+vaxhM7tq1mj/oc0pgB0RmJHQG
	MuH4NP9OXMqLDO2/fKNtI6KwVPH8hZZYyvo/doabx1zAENf8MRsdgv6UNwHPbMor
	9JAAg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41bskm5qyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 21:56:47 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 484Luk1h022785;
	Wed, 4 Sep 2024 21:56:46 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41bskm5qym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 21:56:46 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 484L7HFk012058;
	Wed, 4 Sep 2024 21:56:45 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41cegq1sm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 21:56:45 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 484LuiIf35586726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Sep 2024 21:56:45 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B29A05805D;
	Wed,  4 Sep 2024 21:56:44 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2EA5458054;
	Wed,  4 Sep 2024 21:56:44 +0000 (GMT)
Received: from [9.61.11.70] (unknown [9.61.11.70])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Sep 2024 21:56:44 +0000 (GMT)
Message-ID: <624b6761-c8b0-4e75-9799-0fd7bd9040f3@linux.ibm.com>
Date: Wed, 4 Sep 2024 16:56:42 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] Input: ibm-panel - use guard notation when
 acquiring spinlock
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
        Ville Syrjala <syrjala@sci.fi>,
        Support Opensource <support.opensource@diasemi.com>,
        Andrey Moiseev <o2g.org.ru@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Javier Carrasco <javier.carrasco.cruz@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044735.1047285-1-dmitry.torokhov@gmail.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240904044735.1047285-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mp7mdMN7q5OAEpY89sY41q4-iQqKaGaN
X-Proofpoint-ORIG-GUID: eMcpxFwFg_mvONTNaE6isx5ET5DfHd4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_19,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040163


On 9/3/24 23:47, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/input/misc/ibm-panel.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
> index 867ac7aa10d2..aa48f62d7ea0 100644
> --- a/drivers/input/misc/ibm-panel.c
> +++ b/drivers/input/misc/ibm-panel.c
> @@ -77,12 +77,11 @@ static void ibm_panel_process_command(struct ibm_panel *panel)
>   static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
>   				  enum i2c_slave_event event, u8 *val)
>   {
> -	unsigned long flags;
>   	struct ibm_panel *panel = i2c_get_clientdata(client);
>   
>   	dev_dbg(&panel->input->dev, "event: %u data: %02x\n", event, *val);
>   
> -	spin_lock_irqsave(&panel->lock, flags);
> +	guard(spinlock_irqsave)(&panel->lock);
>   
>   	switch (event) {
>   	case I2C_SLAVE_STOP:
> @@ -114,8 +113,6 @@ static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
>   		break;
>   	}
>   
> -	spin_unlock_irqrestore(&panel->lock, flags);
> -
>   	return 0;
>   }
>   

