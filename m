Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BE6470297
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 15:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbhLJOVn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 09:21:43 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27208 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235573AbhLJOVm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 09:21:42 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BAE8bZ1002169;
        Fri, 10 Dec 2021 14:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=gX5zSgsNpeIFrSUhDMkaMioIa+YuphbK9w9r7t+HgMk=;
 b=CW6u7ri1dGzFBRUIjAzwIvuyEF47RvxlJoge0CnqHhES33d8iVL0JLAae0zMJqx7QYy3
 MS0LRJ2rd1eupqkSC9UZ1o+jtHh6Hp5GJ4Hw4zOFP8UfzhTV0auBgD57hXizkP3uOg/H
 xfsJTBmNRk+lHfxdFpR44f6sZ9/APbK0VmhL2EKXkA59v2vfQ9/J+VGG6tdY01L7zhfZ
 mabVS8RyA8X7Kp/iJmOpcNJxn4/mfms7Yb3YraK7cHpmGiuL9n8XYfMeCqbPSimzTV4W
 CSGhHAE8/KojZGcJNs1eX0lVITab6LPu1BsR3AyE7xyzeymnvX9me0P1rOGacgoR2Qnw Xw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ctrj2xe2n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 14:18:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BAEGq5Q186771;
        Fri, 10 Dec 2021 14:18:03 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
        by userp3020.oracle.com with ESMTP id 3cr1sua7ae-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 14:18:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAXXl6Hb899W1vp7clt+npnQQUL9C0Zx2rqf8Zs+CsrMkMsMWuXiJZi544bud93GjwOt7gKIQ1zK64EVt6vWpDCXTNBKtrWr81+2A2CktS3LH+GuWtW3LHCjIkXCBdx0uDUlMgldL0JTZMPi/ylchhoYWtT41mQQYgKhWnoFQhzkeNzkPK1oVZ099XAWHgOwDcbMC7IXdxpAcNW5Aqy5rc2laugw6qte2T0nAGdW2kQxj0HngjDDgqA+ruUOpzp3FUyho15TLM5duRErSwZGJLiMqhuhLU/vLrg3f798XJmLaENHsRWZDhxlGYpYmmNCL8NNcUUtvr9nnX+HJ+PyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX5zSgsNpeIFrSUhDMkaMioIa+YuphbK9w9r7t+HgMk=;
 b=YmRkCifYjVmufGAwUF6ggLGRZPq7cBCDFE4KkVoimEnhv5X9x7RXQT23u3HGvxGghv0Pfkn7cMx50LTG7p/JBGVRoB165qvMR3rijfce8bdPjAPSM/TftMp7XTdf9A1fOv2TIfCKKAIc0ga4BzYRcOpqhp0v+zA4B10hcy4aN1b2U+t0tm83FeWcufXCPzltF7SN3lA9UZeOYndGwQNeifr57nf3l+LJLIxyoC1n/yEPjBx/sDxjTJjuMCw5K9OYECo5y/auxgGSObZ0NwX1wfIfcTiLHC0b6lv0zYmZyEuwg/8atH3KDYtb8yRdh19f0x71wJtZ9/BTNiL6CTC0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX5zSgsNpeIFrSUhDMkaMioIa+YuphbK9w9r7t+HgMk=;
 b=fWinVRczhI0XHhdLc/QzmTsHxd1B1rz8d/Zv6AbA3euRiCwmwtSFpkgnxnWX+M3AkGv60ylzGsW/KX0XkysioKsvSyqjz5/m9hjUIFO/zm2mm0k98jeZ8X5qfcbiwprY4W4Xat4ItG39BwXF6jpSPAgMRk5NFezPNMJLfvUA7KE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1823.namprd10.prod.outlook.com
 (2603:10b6:300:110::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Fri, 10 Dec
 2021 14:18:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 14:18:00 +0000
Date:   Fri, 10 Dec 2021 17:17:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-input@vger.kernel.org
Cc:     madcatxster@devoid-pointer.net
Subject: [bug report] HID: hid-lg4ff: Protect concurrent access to output HID
 report
Message-ID: <20211210141740.GA18820@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: JN2P275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by JN2P275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend Transport; Fri, 10 Dec 2021 14:17:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db76d58-24a3-47f5-bbc9-08d9bbe7dea7
X-MS-TrafficTypeDiagnostic: MWHPR10MB1823:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1823C816A1D21959213E24838E719@MWHPR10MB1823.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wl6G7e7eqX5yY+bh9txDlpPqHYVYTmWz3xqRwbSGBkMvPGz5QvPxwGPSSa3UlVz+IedNPKmyvZgl7QDH3mIkY3XaU7xwZ6h0XtihBvStrEHh4AFArS+BAa3ZzGlDTuhMCjfeImpIFwnle2CVCIzIzuhgOQyr8FjxAf5ePDEM1RwCwRvRS9tA15xE0dIpmq1DYPPaQfoLsxv1FhPyTPL4OGYFvPXbsuaywUieuShMQCQ+8a6bqAXM3U073iVCMybhI5Lz6duoyLyfQtbtlOXDFuuN+MFnn6Es+DyLf9twG4xC4fElujF8eOrKVGxZfL727oZTIoRRuLJIEmw9s1PUFwQWFmLazvLkEQJRXIAdAnfD50g5OdN1TS+lMFcXW9YAYVRLosIzDyWx58hILMFW9sP6l64yNf9LFOh96U+Ak3BIrUtiY0iXZDyqWX7L2ZbcuXnInerJejB6rSEOQq5QUHKRD8t+G4ZnUvXIS/m0qpn5LpeVgyt8PRta/aUY3sXFbV5dUGLrC0yyyBm1JGXzBcxYAMlfCDH9qp5qK5Hj085JOUE7zGbaoh+C4ECx0rowDOrJWUv7XtlgdB2veDuEmf1VZxBKAMfh7q/GpelExBjtW5FFW17qSU5xkAbUBbg0tyf1YaD98bB/OOfNwMq7AD0rM5k9ovI+jz3BskikIXAqM1h0v8RcjiIm7+hQrzya1OH/sf7WuA4iZIdNpVU0zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33656002)(6666004)(4326008)(1076003)(55016003)(9576002)(86362001)(26005)(8936002)(316002)(38100700002)(66476007)(38350700002)(66556008)(66946007)(2906002)(5660300002)(6496006)(52116002)(33716001)(8676002)(186003)(6916009)(956004)(9686003)(83380400001)(44832011)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jkh4FzNlOk70c/f18yFv68dUWfEEIId0Mmhs1ANg0uBuuZqin2jz4gVdFoZR?=
 =?us-ascii?Q?jf2ZqS7esSOmraIdgQ/+UiYC8pEKgF1XZBr69Wid+2OfUFEBP4gRBH9ngYiT?=
 =?us-ascii?Q?sdz1QpXST6Q9CE76v90mpCE9VNCpwaLPTe/uk8Kz3aX2GQY686vFjBEjipZ5?=
 =?us-ascii?Q?tulWXQX5eE9LXIHxqVkbQXUVEz7J1Wg1Z43kVXI6WdoKMhYqE6KoA/wim24T?=
 =?us-ascii?Q?gxpvDVeFlK9CvibGcg9J+GvhmmIbzm7HMFyveiiKlWb6BOYu9qegHfj8zVRH?=
 =?us-ascii?Q?eTozu0jqGrOsCdLru1L0UopxQbUo7Bec46X1xOPa0UTYLW/abf+qfXuH8PcU?=
 =?us-ascii?Q?2ZiReinFzMMy+ExR895sCQSYmUj41DTL/mnG9vBNXf9JETQn32qBr4JUzDfn?=
 =?us-ascii?Q?3rS8VxBBkOg0qXsRYdFn7EKplSk1Oj338me3K8iOYyokhi7lW1JrMknyfEwx?=
 =?us-ascii?Q?hITi8hjSsNCLm8+w9sSqbuuo9IHk8Ne3xCF4pi8xhK3MLAauMvigGN6ASTX2?=
 =?us-ascii?Q?HYHtO3e5jRKX90A9Jbcz8xsfxh2YIBX2C8E4Idpc44mQRknC8+XcA/6Lpl71?=
 =?us-ascii?Q?a06X8IjQ1MdXBm4egO8HeAB67Cz3aJw0srqECgwswxBBcLan0TXX7mzqy9uJ?=
 =?us-ascii?Q?PDdkskg51YYMDtbwDtG8Am5Num7lEC2Iqt5/IUl6RPK2DDEqHhTC295GUOgq?=
 =?us-ascii?Q?+lwTHI2YRL954JcY8lZDd4zSEAkiocy1ti2vn+SoQOG8++I13MM0ZHYhmqMP?=
 =?us-ascii?Q?tswXpRushD3IYAqqITPoUsKflPSvRITB4TaMzZMT7NfgUTYibYzqPbw7Eu50?=
 =?us-ascii?Q?glyWDrv4tbhy89vZF21HC3yeZyyv1sSbd/cJgATlklZardOHSDU+DaTNoE0/?=
 =?us-ascii?Q?WqrdiHxaPfWk2VXUjs00hQzYJuh0aCPG7rAX70VrXFa7l0d08n4I/uyKadK1?=
 =?us-ascii?Q?uaQjDiQZdacXGTnrVuI2Up/fNuVCiYjhnFhiEClmxIi5GrDYqkniW1pCJK5N?=
 =?us-ascii?Q?Mze6DK3N7NTrjoXfHkZwA2u4nk+AQI7j9PICPdKYmLJXkc2M9LEHkvr9C2Lm?=
 =?us-ascii?Q?bmlpqQmoQCi5V5x+HcewNSawTIGOPdK+SSv0pwc5nKzvxhiSG6iKwv98rov4?=
 =?us-ascii?Q?POSJy9zMH81uYbFZxb1NvuXTqBEHb/wvfQdtD1eA3nJy+0zZaJEL6ftkq+SK?=
 =?us-ascii?Q?IJO6lMU1REvMnvK9KnUeYEtWV9ypoWv3JwL+Ey9qplqXMU1BPQkolHHnoWdo?=
 =?us-ascii?Q?46klgPAL4+SASLMDS95BrLLjY9rF/1HoOlx6Ecgzk9L0b64QDQpmDBvpSr+R?=
 =?us-ascii?Q?7bQQL6fQWiHCD4wVBPO5dpKLI7t7tPhUePaybCtBFp+116PCMPj+Nfr+rE9/?=
 =?us-ascii?Q?wGsfu09I1TZ3mq9MdN7CjMIhq8qwoGn0ksiXl7LlU4VEy7P5z+YSNj+5cgGI?=
 =?us-ascii?Q?Z+jr5gbdRhHVGobgNoDMLAOliJ1uqluSjTgmyNy8lNB86KAEpn+IZOCdEYkn?=
 =?us-ascii?Q?ZaLUmM3VfcR5mFqfKN+v08lc/a0X8wHS5XF2nGvwhgBaxDafqeCbobIMyMJa?=
 =?us-ascii?Q?B5qOzhfrifrGO+1HAAKF3iA5YFxuovpCZVtBr3zKn0Ayol47IgWzpxQRpCrr?=
 =?us-ascii?Q?fLDYI0QfViGPX+ZNvpqO17CvtGIDgFVfzR32KDz8YzbukJZ17ApB5ROLGqrY?=
 =?us-ascii?Q?BMOjMfRLghY5u1toG77rkJfJxbw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db76d58-24a3-47f5-bbc9-08d9bbe7dea7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:18:00.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXa28KuoW2BA1TB4UVJrbtqe7N5k5UG+YHRvT3xJcUAwVhvGlM4JiXgAdi7xhknbekPyb3Ar+ThuJnZdjJtqwAqPrR9G/pIo/S+QRh6iZJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1823
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=948 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112100082
X-Proofpoint-ORIG-GUID: CCjCTbxcWSw-uTAU7bWas203uxlENlt-
X-Proofpoint-GUID: CCjCTbxcWSw-uTAU7bWas203uxlENlt-
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello HID developers,

The patch c918fe781fab: "HID: hid-lg4ff: Protect concurrent access to
output HID report" from Apr 8, 2015, leads to the following Smatch
static checker warning:

	drivers/hid/hid-core.c:2142 hid_hw_request()
	warn: sleeping in atomic context

drivers/hid/hid-core.c
    2132  * @hdev: hid device
    2133  * @report: report to send
    2134  * @reqtype: hid request type
    2135  */
    2136 void hid_hw_request(struct hid_device *hdev,
    2137                     struct hid_report *report, int reqtype)
    2138 {
    2139         if (hdev->ll_driver->request)
    2140                 return hdev->ll_driver->request(hdev, report, reqtype);
                                      ^^^^^^^^^^^^^^^^^^^
There are three functions which implement ll_driver->request() in my
allmodconfig build: ishtp_hid_request(), amdtp_hid_request() and
usbhid_request().  The first two can sleep but usbhid_request() does not.

The problem is that a number of callers call hid_hw_request() with a
spinlock held.  It only affect two drivers, picolcd and lg4ff.  It's
possible that for those drivers we know that ->request() is going to
be usbhid_request() but I don't know the code at all.

    2141 
--> 2142         __hid_request(hdev, report, reqtype);
                 ^^^^^^^^^^^^^
This function definitely sleeps.

    2143 }

picolcd_send_and_wait() <- disables preempt
picolcd_reset() <- disables preempt
picolcd_operation_mode_store() <- disables preempt
picolcd_fb_send_tile() <- disables preempt
picolcd_fb_update() <- disables preempt
-> picolcd_fb_reset() <- disables preempt
picolcd_set_brightness() <- disables preempt
picolcd_leds_set() <- disables preempt
picolcd_set_contrast() <- disables preempt

lg4ff_play() <- disables preempt
lg4ff_set_autocenter_default() <- disables preempt
lg4ff_set_autocenter_ffex() <- disables preempt
lg4ff_set_range_g25() <- disables preempt
lg4ff_set_range_dfp() <- disables preempt
lg4ff_switch_compatibility_mode() <- disables preempt

Here is a sample caller:

drivers/hid/hid-picolcd_core.c
    90          mutex_lock(&data->mutex);
    91          spin_lock_irqsave(&data->lock, flags);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Takes a lock.

    92          for (i = k = 0; i < report->maxfield; i++)
    93                  for (j = 0; j < report->field[i]->report_count; j++) {
    94                          hid_set_field(report->field[i], j, k < size ? raw_data[k] : 0);
    95                          k++;
    96                  }
    97          if (data->status & PICOLCD_FAILED) {
    98                  kfree(work);
    99                  work = NULL;
   100          } else {
   101                  data->pending = work;
   102                  hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
                        ^^^^^^^^^^^^^^^

   103                  spin_unlock_irqrestore(&data->lock, flags);
   104                  wait_for_completion_interruptible_timeout(&work->ready, HZ*2);
   105                  spin_lock_irqsave(&data->lock, flags);
   106                  data->pending = NULL;
   107          }
   108          spin_unlock_irqrestore(&data->lock, flags);
   109          mutex_unlock(&data->mutex);
   110          return work;
   111  }

regards,
dan carpenter
